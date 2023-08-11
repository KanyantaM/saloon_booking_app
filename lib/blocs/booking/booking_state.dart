

// Define the Bloc states
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BookingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServicesNotSelected extends BookingState{}

class VerifingSelectedServices extends BookingState{}

class VerifiedSelectedServices extends BookingState{}

class VerficationServicesError extends BookingState{
  final String errorMessage;

  VerficationServicesError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}



class BookingInitial extends BookingState {}

class BookingLoaded extends BookingState {
  final List<DateTimeRange> bookings;

  BookingLoaded(this.bookings);

  @override
  List<Object?> get props => [bookings];
}

class BookingError extends BookingState {
  final String errorMessage;

  BookingError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

