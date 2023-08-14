import 'package:beautonomi/model/appointment.dart';
import 'package:equatable/equatable.dart';


abstract class MyBookingState extends Equatable {
  @override
  List<Object?> get props => [];
}

//all my bookings
class AllMyBookingInitialState extends MyBookingState {}

class AllMyBookingLoadingState extends MyBookingState {}

class AllMyBookingLoadedState extends MyBookingState {
  final List<Appointment> appoinents;

  AllMyBookingLoadedState(this.appoinents);

  @override
  List<Object?> get props => [appoinents];
}

//my bookigs awaiting
class MyAwaitedBookingInitialState extends MyBookingState {}

class MyAwaitedBookingLoadingState extends MyBookingState {}

class MyAwaitedBookingLoadedState extends MyBookingState {
  final List<Appointment> appoinents;

  MyAwaitedBookingLoadedState(this.appoinents);

  @override
  List<Object?> get props => [appoinents];
}

//

class DeletedMyBookingState extends MyBookingState{

  DeletedMyBookingState();

  @override
  List<Object?> get props => [];
}

class AllMyBookingErrorState extends MyBookingState {
  final String message;

  AllMyBookingErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
