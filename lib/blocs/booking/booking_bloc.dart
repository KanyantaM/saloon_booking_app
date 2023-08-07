// Define the BookingBloc
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/appointment.dart';
import '../../utilites/booking/booking.dart';
import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository bookingRepository;

  BookingBloc(this.bookingRepository) : super(BookingInitial());

  Stream<BookingState> mapEventToState(BookingEvent event) async* {
    if (event is FetchBookings) {
      // Fetch bookings from Firestore and convert them to DateTimeRanges
      try {
        List<Appointment> bookings = await bookingRepository.getBookings();
        List<DateTimeRange> convertedBookings =
            convertBookingListToDateTimeRanges(bookings);
        yield BookingLoaded(convertedBookings);
      } catch (e) {
        yield BookingError("Error fetching bookings");
      }
    } else if (event is AddBooking) {
      // Upload the new booking to Firestore
      try {
        await bookingRepository.uploadBooking(event.newBooking);
        List<Appointment> updatedBookings =
            await bookingRepository.getBookings();
        List<DateTimeRange> convertedBookings =
            convertBookingListToDateTimeRanges(updatedBookings);
        yield BookingLoaded(convertedBookings);
      } catch (e) {
        yield BookingError("Error adding booking");
      }
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
