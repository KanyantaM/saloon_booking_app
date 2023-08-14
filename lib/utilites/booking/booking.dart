import 'package:beautonomi/utilites/constants.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/appointment.dart';


final CollectionReference bookings =
    FirebaseFirestore.instance.collection('bookings');
//this is for the booking screen
CollectionReference<Appointment> getBookingStream({required String placeId}) {
  return bookings
      // .doc(placeId)
      // .collection('bookings')
      .withConverter<Appointment>(
          fromFirestore: (snapshots, _) => Appointment.fromJson(snapshots.data()!),
          toFirestore: (snapshots, _) {
            return snapshots.toJson();
          });
}

Future<dynamic> uploadBookingToFirebase(
    {required BookingService newBooking}) async {
  await bookings
      // .doc(branches.keys.toList()[0])
      // .collection('bookings')
      .add(newBooking.toJson());
}

Stream<dynamic> getBookingStreamFirebase(
    {required DateTime end, required DateTime start}) {
  return getBookingStream(placeId: branches.keys.toList()[0])
      .where('bookingStart', isGreaterThanOrEqualTo: start)
      .where('bookingStart', isLessThanOrEqualTo: end)
      .snapshots();
}

List<DateTimeRange> convertStreamResultToFirebase(
    {required dynamic streamResult}) {
  List<DateTimeRange> converted = [];
  for (int i = 0; i < streamResult.size; i++) {
    final item = streamResult.docs[i].data();
    converted.add(
        DateTimeRange(start: (item.bookingStart!), end: (item.bookingEnd!)));
  }
  return converted;
}

//this is for the my bookings
Future<Stream<List<Appointment>>> getAllMyBookingStreamFirebase(
    {required DateTime end, required DateTime start, required userID, required int section}) async{
   if(section == 1){
  return  getBookingStream(placeId: branches.keys.toList()[0])
      .where('bookingStart', isGreaterThanOrEqualTo: start)
      .where('bookingStart', isLessThanOrEqualTo: end)
      .where('userId', isEqualTo: userID)
      .where('confirmed', isEqualTo: false )
      .snapshots()
      .map((querySnapshot)=> querySnapshot.docs.map((e) => e.data()).toList());
}else if(section == 2){
  return  getBookingStream(placeId: branches.keys.toList()[0])
      .where('bookingStart', isGreaterThanOrEqualTo: start)
      .where('bookingStart', isLessThanOrEqualTo: end)
      .where('userId', isEqualTo: userID)
      .where('confirmed', isEqualTo: true )
      .snapshots()
      .map((querySnapshot)=> querySnapshot.docs.map((e) => e.data()).toList());
} else if(section == 3){
  return  getBookingStream(placeId: branches.keys.toList()[0])
      .where('bookingStart', isGreaterThanOrEqualTo: DateTime.now())
      .where('bookingStart', isLessThanOrEqualTo: DateTime.now().add(Duration(minutes: serviceDuration)))
      .where('userId', isEqualTo: userID)
      .where('confirmed', isEqualTo: true )
      .snapshots()
      .map((querySnapshot)=> querySnapshot.docs.map((e) => e.data()).toList());
} else
{
  return  getBookingStream(placeId: branches.keys.toList()[0])
      .where('bookingStart', isGreaterThanOrEqualTo: start)
      .where('bookingStart', isLessThanOrEqualTo: end)
      .where('userId', isEqualTo: userID)
      .snapshots()
      .map((querySnapshot)=> querySnapshot.docs.map((e) => e.data()).toList());
}
}

// List<Appointment> convertAllMyBookingStreamResultsToList(
//     {required dynamic streamResult}) {
//   List<Appointment> converted = [];
//   for (int i = 0; i < streamResult.size; i++) {
//     final item = streamResult.docs[i].data();
//     converted.add(
//         item);
//   }
//   return converted;
// }


Future<void> deleteMyBooking(String bookingId) async{
  await bookings.doc(bookingId).delete();
}