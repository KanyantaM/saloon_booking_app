import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../../data/repositories/googe_maps_repository.dart';
import '../../utilites/constants.dart';
import '../../utilites/location/finding_user.dart';
import '../../widget/custom_list_tile.dart';
import '../../widget/custom_text.dart';


// Business Logic - BLoC

abstract class BranchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BranchInitialState extends BranchState {}

class UseCurrentLocationState extends BranchState{
  @override
  List<Object?> get props => [];
}

class DontUseCurrentLocationState extends BranchState{
  @override
  List<Object?> get props => [];
}

class BranchUpdatedState extends BranchState {
  final LatLng currentLocation;
  final LatLng destination;
  final Set<Marker> markers;
  final Set<Polyline> polylines;

  BranchUpdatedState({
    required this.currentLocation,
    required this.destination,
    required this.markers,
    required this.polylines,
  });

  @override
  List<Object?> get props => [currentLocation, destination, markers, polylines];
}

abstract class BranchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeLocationEvent extends BranchEvent {}

class SearchEvent extends BranchEvent {}

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
    yield UseCurrentLocationState();
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

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  late BranchBloc _branchBloc;
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController _originController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _branchBloc = BranchBloc();
  }

  @override
  void dispose() {
    _branchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BranchBloc>(
      create: (context) => _branchBloc,
      child: BlocConsumer<BranchBloc, BranchState>(
        listener: (context, state) {
          // Handle state changes if needed
        },
        builder: (context, state) {
          if (state is BranchInitialState) {
            // Handle initial state if needed
          } else if (state is BranchUpdatedState) {
            // Access the state properties to build your UI
            final currentLocation = state.currentLocation;
            final destination = state.destination;
            final markers = state.markers;
            final polylines = state.polylines;

            return Scaffold(
              appBar: AppBar(
                title: const Text('Google Maps'),
              ),
              body: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            state is UseCurrentLocationState
                                ? Row(
                                    children: [
                                      TextFormField(
                                        controller: _originController,
                                        decoration: const InputDecoration(
                                            hintText: ' Enter your location  '),
                                        onChanged: (value) {
                                          // print(value);
                                          // showGooglePlacesAutoComplete(context);
                                        },
                                      ),
                                      const SizedBox.expand(),
                                      const Text('Or use current location'),
                                      IconButton(
                                        onPressed: () {
                                          _branchBloc.add(ChangeLocationEvent());
                                        },
                                        icon: const Icon(Icons.location_on),
                                      ),
                                    ],
                                  )
                                : TextButton(
                                    onPressed: () {
                                      _branchBloc.add(ChangeLocationEvent());
                                    },
                                    child: const Text('Change your location')),
                            selectBranch(),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          _branchBloc.add(SearchEvent());
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: markers,
                      polylines: polylines,
                      initialCameraPosition: CameraPosition(
                        target: currentLocation,
                        zoom: 14.4746,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator(),); // Or any loading indicator while initializing
        },
      ),
    );
  }

  ExpansionTileCard selectBranch() {
    return ExpansionTileCard(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      baseColor: const Color(0xffFF0077),
      expandedColor: const Color(0xffFF0479),
      leading: Container(
        height: 45.h,
        width: 45.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: kMainColor),
        child: Center(
            child: Icon(
          Icons.location_searching,
          size: 22.h,
        )),
      ),
      title: CustomText(
        title: 'Select a branch',
        color: kMainColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      shadowColor: kBlackColor,
      animateTrailing: true,
      trailing: Image.asset(
        "assets/angle-bottom.png",
        height: 6.h,
      ),
      children: [
        ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          itemCount: branches.length,
          itemBuilder: (context, index) {
            String branch = branches.keys.toList()[index];
            return CustomLisTileWidget(
              onTap: () {
                _branchBloc.add(SearchEvent());
              },
              title: branch,
            );
          },
        ),
      ],
    );
  }
}
