import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class BranchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetLocationsEvent extends BranchEvent {
  final bool useDeviceLocation;
  final LatLng? userLocation;
  final String branchName;
  final LatLng branchLocation;

  SetLocationsEvent( 
      this.userLocation, this.branchName, this.branchLocation, {this.useDeviceLocation = true});

}
