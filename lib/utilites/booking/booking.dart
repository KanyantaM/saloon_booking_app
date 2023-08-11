import 'package:beautonomi/utilites/constants.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/appointment.dart';


  final CollectionReference bookings =
      FirebaseFirestore.instance.collection('bookings');

  CollectionReference<Appointment> getBookingStream ({required String placeId}){
    return bookings.doc(placeId).collection('bookings').withConverter<Appointment>(fromFirestore: (snapshots, _)=>Appointment.fromFirestore(snapshots), toFirestore: (snapshots, _){return snapshots.toJson();});
  }

  Future<dynamic> uploadBookingToFirebase({required BookingService newBooking}) async{
await bookings.doc(branches.keys.toList()[0]).collection('bookings').add(newBooking.toJson());
}


Stream<dynamic> getBookingStreamFirebase({required DateTime end, required DateTime start}){
  return getBookingStream(placeId: branches.keys.toList()[0]).where('bookingStart', isGreaterThanOrEqualTo: start).where('bookingStart', isLessThanOrEqualTo: end).snapshots();
}

List<DateTimeRange> convertStreamResultToFirebase({required dynamic streamResult}){
  List<DateTimeRange> converted = [];
  for(int i=0; i<streamResult.size; i++){
    final item = streamResult.docs[i].data();
    converted.add(DateTimeRange(start: (item.bookingStart!), end: (item.bookingEnd!)));
  }
  return converted;
}

