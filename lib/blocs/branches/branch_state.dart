import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class BranchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BranchInitialState extends BranchState {}

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
