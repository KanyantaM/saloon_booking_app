import 'package:beautonomi/blocs/booking/booking_bloc.dart';
import 'package:beautonomi/model/client.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/booking/booking_state.dart';
import '../model/baber.dart';

class AppointmentScreen extends StatefulWidget {
  final Client client;
  final Baber baber;
  final double totalCost;
  final Map<String, double> servicesMap;
  const AppointmentScreen(
      {super.key, required this.baber, required this.servicesMap, required this.client, required this.totalCost});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Select a TimeSlot'),
      ),
      body: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          if (state is BookingInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BookingLoaded) {
            return Column(
              children: [
                BookingCalendar(
                    bookingService: BookingService(
                      userEmail: widget.client.email,
                      userPhoneNumber: widget.client.phone,
                      // userName: widget.client.id,
                      userId: widget.client.id,
                      servicePrice: widget.totalCost,
                        bookingStart: DateTime.now(),
                        bookingEnd:
                            DateTime.now().add(const Duration(days: 28)),
                        serviceName: formatMap(widget.servicesMap),
                        serviceDuration: serviceDuration),
                    getBookingStream: state.getBookingStream,
                    uploadBooking: state.uploadBooking,
                    convertStreamResultToDateTimeRanges: state.convertStreamResultToDateTimeRanges,
                    pauseSlots: state.generatePauseSlots(),
                    pauseSlotText: 'LUNCH',
                    bookingButtonColor: kSecondaryColor,
                    selectedSlotColor: kSecondaryColor,
                    bookedSlotColor: kPinkLightColor,
                    )
              ],
            );
          }
          return Container();
        },
      ),
    ));
  }
}

String formatMap(Map<String, double> services){
  String formatted = 'Reciept\n';
  services.forEach((item, price) {formatted += '$item : K${price.toStringAsFixed(2)}\n'; });
  return formatted;
}