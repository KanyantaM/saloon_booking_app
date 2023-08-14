import 'package:beautonomi/data/repositories/crud_repository.dart';
import 'package:equatable/equatable.dart';

abstract class MyBookingEvent extends Equatable{}

class FetchAllBookingsEvent extends MyBookingEvent{
  final int type;
  final String userId = userID;
  final DateTime end = DateTime.now().add(const Duration(days: 28));
  final DateTime start= DateTime.now();

  FetchAllBookingsEvent({required this.type});
  @override
  List<Object?> get props => [userId, end, start];
  
}

class DeleteBooking extends MyBookingEvent{
  final String bookingId;

  DeleteBooking(this.bookingId);
  @override
  List<Object?> get props => [bookingId];
}

class RequestStartedBookings extends MyBookingEvent{
  @override 
  List<Object?> get props => [];
} 