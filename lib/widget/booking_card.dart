import 'package:beautonomi/model/appointment.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:beautonomi/widget/custom_button.dart';
import 'package:beautonomi/widget/custom_list_tile.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final Appointment appointment;
  final void Function()? onSwipe;
  const BookingCard({super.key, required this.appointment, required this.onSwipe});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('${appointment.serviceId}'),
      background: Container(
          color: kGreyDarkColor,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: const Icon(Icons.delete_forever)),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                title: const Icon(Icons.delete_forever_outlined),
                content: const Text(
                    'Are you sure you want to cancel this bookings?'),
                actions: [
                  CustomButton(
                    title: 'No',
                    btnColor: kGreyDarkColor,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  CustomButton(
                    title: 'yes',
                    btnColor: kSecondaryColor,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            }));
      },
      onDismissed: (direction) {
        onSwipe;
      },
      child: Card(
        child: CustomLisTileWidget(
          title:
              'Booking: ${appointment.bookingStart} - ${appointment.bookingEnd}\n Cost: ${appointment.servicePrice}',
          onTap: () {
            //shows some details of the booking when the user taps on the card
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                      'Details\n Bill:${appointment.servicePrice}\n Time:${appointment.bookingStart} - ${appointment.bookingEnd}'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [Text(appointment.serviceName)],
                  ),
                  actions: [
                    CustomButton(
                      title: 'OK',
                      btnColor: kSecondaryColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
