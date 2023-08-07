import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/appointment.dart';

class BookingRepository {
  final CollectionReference _bookingCollection =
      FirebaseFirestore.instance.collection('bookings');

  Future<List<Appointment>> getBookings() async {
    try {
      QuerySnapshot snapshot = await _bookingCollection.get();
      return snapshot.docs.map((doc) => Appointment.fromFirestore(doc)).toList();
    } catch (e) {
      throw Exception("Error fetching bookings: $e");
    }
  }

  Future<void> uploadBooking(Appointment newBooking) async {
    try {
      await _bookingCollection.add(newBooking.toJson());
    } catch (e) {
      throw Exception("Error adding booking: $e");
    }
  }
}
