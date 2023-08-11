// Define the BookingBloc
import 'package:beautonomi/utilites/booking/booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/appointment.dart';
import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial());

  Stream<BookingState> mapEventToState(BookingEvent event) async* {
    if (event is FetchBookings) {
      // Fetch bookings from Firestore and convert them to DateTimeRanges
      try {
        yield BookingLoaded(getBookingStream: getBookingStreamFirebase, uploadBooking: uploadBookingToFirebase, convertStreamResultToDateTimeRanges: convertStreamResultToFirebase );
      } catch (e) {
        yield BookingError("Error fetching bookings");
      }
    
    } else if(event is AddServices){
      if(event.selectedServices.isEmpty){
        yield VerficationServicesError('No service selected\nPlease select a service');
      } else if(event.baber.services.keys.toSet().containsAll(event.selectedServices.keys)){
        yield VerifiedSelectedServices();
      } else {
        yield VerficationServicesError('Invalid Entry');
      }
    } else if(state is VerifiedSelectedServices){
      yield BookingInitial();
    }
  }

  List<DateTimeRange> convertBookingListToDateTimeRanges(
      List<Appointment> bookings) {
    List<DateTimeRange> convertedBookings = [];
    for (var booking in bookings) {
      convertedBookings.add(DateTimeRange(
        start: booking.bookingStart!,
        end: booking.bookingEnd!,
      ));
    }
    return convertedBookings;
  }
}
