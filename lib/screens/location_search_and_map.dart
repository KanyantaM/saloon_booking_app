import 'dart:async';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../blocs/branches/branch_bloc.dart';
import '../blocs/branches/branch_events.dart';
import '../blocs/branches/branch_state.dart';
import '../data/repositories/googe_maps_repository.dart';
import '../utilites/constants.dart';
import '../utilites/location/finding_user.dart';
import '../widget/custom_list_tile.dart';
import '../widget/custom_text.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController _originController = TextEditingController();
  final Set<Marker> _markers = <Marker>{};
  final Set<Polyline> _polylines = <Polyline>{};
  List<LatLng> polygonLatLngs = <LatLng>[];

  bool _useCurrentLocation = false;

  LatLng _currentLocation = const LatLng(-15, 28.3);

  int _polylineIdCounter = 1;
  LatLng _destination = branches.values.first;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: branches.values.first,
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();

    _setMarker(branches.values.first);
  }

  void _setCurrentLocation() {
    setState(() async {
      Position? position = await determineLastPostion();
      _currentLocation = LatLng(position!.latitude, position.longitude);
    });
  }

  void _setDestination(String branch) {
    setState(() {
      _destination = branches[branch]!;
    });
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('marker'),
          position: point,
        ),
      );
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: const CustomText(
          title: "Branch Search",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: kBlackColor,
        ),
        elevation: 2,
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocBuilder<BranchBloc, BranchState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        // _useCurrentLocation
                        //     ? Row(
                        //         children: [
                        //           TextFormField(
                        //             controller: _originController,
                        //             decoration: const InputDecoration(
                        //                 hintText: ' Enter your location  '),
                        //             onChanged: (value) {
                        //               // print(value);
                        //               // showGooglePlacesAutoComplete(context);
                        //               //TODO: allow the user to enter a custom location
                        //             },
                        //           ),
                        //           const SizedBox.expand(),
                        //           const Text('Or use current location'),
                        //           IconButton(
                        //             onPressed: () {
                        //               _useCurrentLocation = true;
                        //               _setCurrentLocation();
                        //             },
                        //             icon: const Icon(Icons.location_on),
                        //           ),
                        //         ],
                        //       )
                        //     : TextButton(
                        //         onPressed: () {
                        //           _useCurrentLocation = false;
                        //           setState(() {});
                        //         },
                        //         child: const Text('Change your location')),
                        ExpansionTileCard(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          baseColor: const Color(0xffFF0077),
                          expandedColor: const Color(0xffFF0479),
                          leading: Container(
                            height: 45.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: kMainColor),
                            child: Center(
                                child: Icon(
                              Icons.location_on,
                              size: 22.h,
                            )),
                          ),
                          title: const CustomText(
                            title: 'Enter a location',
                            // "Facial",
                            color: kMainColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          shadowColor: kBlackColor,
                          animateTrailing: true,
                          trailing: Image.asset(
                            "assets/angle-bottom.png",
                            height: 6.h,
                            // color: kBlackColor,
                          ),
                          children: [
                            CustomLisTileWidget(
                              onTap: () {
                                _useCurrentLocation = true;
                                _setCurrentLocation();
                              },
                              title: 'Use your current location',
                            ),
                            TextFormField(
                              controller: _originController,
                              decoration: const InputDecoration(
                                  hintText: ' Enter your location  '),
                              onChanged: (value) {
                                // print(value);
                                // showGooglePlacesAutoComplete(context);
                                //TODO: allow the user to enter a custom location
                              },
                            ),
                          ],
                        ),
                        ExpansionTileCard(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          baseColor: const Color(0xffFF0077),
                          expandedColor: const Color(0xffFF0479),
                          leading: Container(
                            height: 45.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: kMainColor),
                            child: Center(
                                child: Icon(
                              Icons.location_searching,
                              size: 22.h,
                            )),
                          ),
                          title: const CustomText(
                            title: 'Select a branch',
                            // "Facial",
                            color: kMainColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          shadowColor: kBlackColor,
                          animateTrailing: true,
                          trailing: Image.asset(
                            "assets/angle-bottom.png",
                            height: 6.h,
                            // color: kBlackColor,
                          ),
                          children: [
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              itemCount: branches.length,
                              itemBuilder: (context, index) {
                                String branch = branches.keys.toList()[index];
                                return CustomLisTileWidget(
                                  onTap: () {
                                    _setDestination(branch);
                                    BlocProvider.of<BranchBloc>(context).add(
                                        SetLocationsEvent(_currentLocation,
                                            branch, _destination));
                                  },
                                  title: branch,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      String home = _useCurrentLocation
                          ? '${_currentLocation.latitude},${_currentLocation.longitude}'
                          : _originController.text;
                      String shop =
                          '${_destination.latitude},${_destination.longitude}';
                      var directions = await LocationRepository().getDirections(
                        home,
                        shop,
                      );
                      _goToPlace(
                        directions['start_location']['lat'],
                        directions['start_location']['lng'],
                        directions['bounds_ne'],
                        directions['bounds_sw'],
                      );

                      _setPolyline(directions['polyline_decoded']);
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              );
            },
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: _markers,
              // polygons: _polygons,
              polylines: _polylines,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
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
          25),
    );
    _setMarker(LatLng(lat, lng));
  }
}
