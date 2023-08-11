import 'package:equatable/equatable.dart';

import '../../model/baber.dart';

// Define the Bloc events
abstract class BookingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchBookings extends BookingEvent {}

class AddServices extends BookingEvent{
  final Baber baber;
  final Map<String, double> selectedServices;

  final bool isSubset = true;

  AddServices(this.selectedServices, this.baber);
  @override
  List<Object?> get props => [selectedServices];
}


