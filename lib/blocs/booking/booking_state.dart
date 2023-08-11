import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';


// Define the Bloc states
import 'package:equatable/equatable.dart';

abstract class BookingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServicesNotSelected extends BookingState {}

class VerifingSelectedServices extends BookingState {}

class VerifiedSelectedServices extends BookingState {}

class VerficationServicesError extends BookingState {
  final String errorMessage;

  VerficationServicesError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class BookingInitial extends BookingState {}

class BookingLoaded extends BookingState {
  final Stream<dynamic>? Function(
      {required DateTime end, required DateTime start}) getBookingStream;
  final Future<dynamic> Function({required BookingService newBooking})
      uploadBooking;
  final List<DateTimeRange> Function({required dynamic streamResult})
      convertStreamResultToDateTimeRanges;

  List<DateTimeRange> generatePauseSlots(){
    //TODO: let the user be able to edit this
    return [
      DateTimeRange(start: DateTime(2023,1,1,13), end: DateTime(2025,1,1,14))
    ];
  }

  BookingLoaded(
      {required this.getBookingStream,
      required this.uploadBooking,
      required this.convertStreamResultToDateTimeRanges});

  @override
  List<Object?> get props => [getBookingStream, uploadBooking];
}

class BookingError extends BookingState {
  final String errorMessage;

  BookingError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
