import 'dart:async';

import 'package:beautonomi/blocs/branches/branch_events.dart';
import 'package:beautonomi/blocs/branches/branch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../../data/repositories/googe_maps_repository.dart';
import '../../utilites/constants.dart';
import '../../utilites/location/finding_user.dart';


// Business Logic - BLoC


class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController _originController = TextEditingController();
  final Set<Marker> _markers = <Marker>{};
  final Set<Polyline> _polylines = <Polyline>{};
  bool _useCurrentLocation = false;
  LatLng _currentLocation = const LatLng(-15, 28.3);
  final LatLng _destination = branches.values.first;
  int _polylineIdCounter = 1;

  BranchBloc() : super(BranchInitialState());

  Stream<BranchState> mapEventToState(BranchEvent event) async* {
    if (event is ChangeLocationEvent) {
      yield* _mapChangeLocationEventToState();
    } else if (event is SearchEvent) {
      yield* _mapSearchEventToState();
    }
  }

  Stream<BranchState> _mapChangeLocationEventToState() async* {
    _useCurrentLocation = !_useCurrentLocation;
    if (_useCurrentLocation) {
      Position? position = await determineLastPostion();
      _currentLocation = LatLng(position!.latitude, position.longitude);
      yield UseCurrentLocationState();
    }
    yield DontUseCurrentLocationState();
    yield BranchUpdatedState(
      currentLocation: _currentLocation,
      destination: _destination,
      markers: _markers,
      polylines: _polylines,
    );
  }

  Stream<BranchState> _mapSearchEventToState() async* {
    String home = _useCurrentLocation
        ? '${_currentLocation.latitude},${_currentLocation.longitude}'
        : _originController.text;
    String shop = '${_destination.latitude},${_destination.longitude}';
    var directions = await LocationRepository().getDirections(home, shop);
    _goToPlace(
      directions['start_location']['lat'],
      directions['start_location']['lng'],
      directions['bounds_ne'],
      directions['bounds_sw'],
    );

    _setPolyline(directions['polyline_decoded']);

    yield BranchUpdatedState(
      currentLocation: _currentLocation,
      destination: _destination,
      markers: _markers,
      polylines: _polylines,
    );
  }

  void _setMarker(LatLng point) {
    _markers.add(
      Marker(
        markerId: MarkerId('marker'),
        position: point,
      ),
    );
  }

  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_$_polylineIdCounter';
    _polylineIdCounter++;

    _polylines.add(
      Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 2,
        color: kSecondaryColor,
        points: points
            .map(
              (point) => LatLng(point.latitude, point.longitude),
            )
            .toList(),
      ),
    );
  }

  Future<void> _goToPlace(
    double lat,
    double lng,
    Map<String, dynamic> boundsNe,
    Map<String, dynamic> boundsSw,
  ) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );

    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
          northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
        ),
        25,
      ),
    );
    _setMarker(LatLng(lat, lng));
  }
}

// UI - MapScreenState

