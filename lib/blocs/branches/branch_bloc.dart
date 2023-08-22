import 'dart:async';

import 'package:beautonomi/blocs/branches/branch_events.dart';
import 'package:beautonomi/blocs/branches/branch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utilites/location/finding_user.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  BranchBloc() : super(LocationsInitialState());


  Stream<BranchState> mapEventToState(BranchEvent event) async* {
    if (event is SetLocationsEvent) {
      if (event.useDeviceLocation) {
        Position? position = await determineLastPostion();
        LatLng currentLocation = LatLng(position!.latitude, position.longitude);
        yield LocationLoadedState(userLocation:currentLocation, destination: event.branchLocation, destinationName:event.branchName);
      } else {
        //TODO: allow the user ot manually find their location
      }
    }   }
}
