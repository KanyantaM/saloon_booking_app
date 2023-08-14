import 'package:beautonomi/blocs/crud/my_bookings/my_booking_state.dart';
import 'package:beautonomi/blocs/crud/my_bookings/my_bookings_bloc.dart';
import 'package:beautonomi/blocs/crud/my_bookings/my_bookings_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilites/constants.dart';
import '../../../widget/booking_card.dart';
import '../../../widget/custom_text.dart';

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
          child: Text('Fetching Bookigns'),
        );
      } else if (state is AllMyBookingLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is AllMyBookingLoadedState) {
        if (state.appoinents.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/No data-cuate.png",
                height: 177.h,
              ),
              SizedBox(
                height: 30.h,
              ),
              const CustomText(
                title: "No Bookings found!",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: kBlackColor,
              ),
            ],
          );
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
        return const Center(
          child: Text('Can\'t Fetch Bookigns'),
        );
      }
    });
  }
}
