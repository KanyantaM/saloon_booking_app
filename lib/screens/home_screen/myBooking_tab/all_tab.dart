import 'package:beautonomi/blocs/crud/my_bookings/my_booking_state.dart';
import 'package:beautonomi/blocs/crud/my_bookings/my_bookings_bloc.dart';
import 'package:beautonomi/blocs/crud/my_bookings/my_bookings_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widget/booking_card.dart';
import '../../../widget/no_data_cuate.dart';

class AllTabScreen extends StatelessWidget {
  const AllTabScreen({Key? key, required this.screen}) : super(key: key);
  final int screen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBookingBloc, MyBookingState>(
        builder: (context, state) {
      if (state is AllMyBookingInitialState) {
        BlocProvider.of<MyBookingBloc>(context).add(FetchAllBookingsEvent(type: screen));
        return const Center(
          child: Text('Fetching Bookings'),
        );
      } else if (state is AllMyBookingLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is AllMyBookingLoadedState) {
        if (state.appoinents.isEmpty) {
          return const NoDataCuate(issue:'No bookings found');
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              final myBooking = state.appoinents[index];
              return BookingCard(
                appointment: myBooking,
                onSwipe: () {
                  BlocProvider.of<MyBookingBloc>(context)
                      .add(DeleteBooking(myBooking.serviceId!));
                },
              );
            },
            itemCount: state.appoinents.length,
          );
        }
      } else {
        return const NoDataCuate(issue: 'Couldn\'t find any bookings');
      }
    });
  }
}

