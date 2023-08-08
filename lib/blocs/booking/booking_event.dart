import 'package:equatable/equatable.dart';

import '../../model/appointment.dart';

// Define the Bloc events
abstract class BookingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchBookings extends BookingEvent {}

class AddServices extends BookingEvent{
  final Map<String, double> services;

  AddServices(this.services);
  @override
  List<Object?> get props => [services];
}

class AddBooking extends BookingEvent {
  final Appointment newBooking;

  AddBooking(this.newBooking);

  @override
  List<Object?> get props => [newBooking];
}
