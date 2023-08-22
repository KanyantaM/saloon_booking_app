import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class BranchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationsInitialState extends BranchState {}

class LocationLoadedState extends BranchState{
  final LatLng userLocation;
  final LatLng destination;
  final String destinationName;

  LocationLoadedState({required this.userLocation, required this.destination, required this.destinationName});

  

  @override
  List<Object?> get props => [ destination, destinationName, userLocation];
}
