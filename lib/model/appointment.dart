import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  final String? userId;
  final String? userName;
  final String? baberId;
  final String? branchId;
  final Map<String, double>? services;
  final double servicePrice;
  final DateTime? bookingStart;
  final DateTime? bookingEnd;
  final String? userContact;
  final String? branchName;
  final String? baberName;

  Appointment({
    this.userId,
    this.userName,
    this.baberId,
    this.branchId,
    this.services,
    this.servicePrice = 0.0,
    this.bookingStart,
    this.bookingEnd,
    this.userContact,
    this.branchName,
    this.baberName,
  });

  factory Appointment.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Appointment(
      userId: data['userId'],
      userName: data['userName'],
      baberId: data['baberId'],
      branchId: data['branchId'],
      services: data['services'],
      servicePrice: data['servicePrice'],
      bookingStart: data['bookingStart']?.toDate(),
      bookingEnd: data['bookingEnd']?.toDate(),
      userContact: data['userContact'],
      branchName: data['branchName'],
      baberName: data['baberName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'baberId': baberId,
      'branchId': branchId,
      'services': services,
      'servicePrice': servicePrice,
      'bookingStart': bookingStart,
      'bookingEnd': bookingEnd,
      'userContact': userContact,
      'branchName': branchName,
      'baberName': baberName,
    };
  }
}
