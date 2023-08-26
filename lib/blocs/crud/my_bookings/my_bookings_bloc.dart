import 'package:beautonomi/utilites/booking/booking.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_booking_state.dart';
import 'my_bookings_events.dart';

class MyBookingBloc extends Bloc<MyBookingEvent, MyBookingState> {
  MyBookingBloc() : super(AllMyBookingInitialState()){
    on<FetchAllBookingsEvent>(((event, emit) async{
      emit(AllMyBookingLoadingState());
      try{
      final allMyBookingsStream = await getAllMyBookingStreamFirebase(
            end: event.end, start: event.start, userID: event.userId, section: event.type);
        await for (final allMyBookings in allMyBookingsStream) {
          emit( AllMyBookingLoadedState(allMyBookings));
        }}catch(e){
          emit(AllMyBookingErrorState(e.toString()));
        }
    }));
    on<DeleteBooking>((event, emit) async{
      try{
      await deleteMyBooking(event.bookingId);
        emit(DeletedMyBookingState());   }catch(e){
          emit(AllMyBookingErrorState(e.toString()));
        }   
    },);
  }

  // Stream<MyBookingState> mapEventToState(MyBookingEvent event) async* {
  //   yield AllMyBookingLoadingState();
  //   try {
  //     if (event is FetchAllBookingsEvent) {
  //       final allMyBookingsStream = await getAllMyBookingStreamFirebase(
  //           end: event.end, start: event.start, userID: event.userId, section: event.type);
  //       await for (final allMyBookings in allMyBookingsStream) {
  //         yield AllMyBookingLoadedState(allMyBookings);
  //       }
  //     } else if (event is DeleteBooking) {
  //       await deleteMyBooking(event.bookingId);
  //       yield DeletedMyBookingState();
  //     }
  //   } on Exception catch (e) {
  //     yield AllMyBookingErrorState(e.toString());
  //   }
  // }
}
