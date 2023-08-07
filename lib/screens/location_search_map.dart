import 'dart:async';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../blocs/branches/branch_bloc.dart';
import '../blocs/branches/branch_events.dart';
import '../blocs/branches/branch_state.dart';
import '../utilites/constants.dart';
import '../widget/custom_list_tile.dart';
import '../widget/custom_text.dart';

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
            // final destination = state.destination;
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
