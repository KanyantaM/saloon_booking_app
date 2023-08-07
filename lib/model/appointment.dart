import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/firebase_constants.dart';

class Appointment {
  late String baberName;
  late String clientId;
  late String clientName;
  late String clientPhone;
  late bool isReviewed;
  late String note;
  late String saloonContact;
  late String saloonName;
  late String status;
  late DateTime slotTime;
  late String baberId;
  late List<dynamic> services;
  late DateTime createdAt;
  late String? id;
  late double cost;
  late String saloonId;

  Appointment({
    required this.saloonId,
    required this.baberName,
    required this.clientId,
    required this.clientName,
    required this.clientPhone,
    required this.isReviewed,
    required this.note,
    required this.saloonContact,
    required this.saloonName,
    required this.status,
    required this.slotTime,
    required this.baberId,
    required this.services,
    required this.createdAt,
    this.id,
    required this.cost,
  });

  Appointment.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnaphot}) {
    baberName = documentSnaphot.get(field_baber_name);
    clientId = documentSnaphot.get(field_client_id);
    clientName = documentSnaphot.get(field_client_name);
    isReviewed = documentSnaphot.get(field_is_reviewed);
    note = documentSnaphot.get(field_client_note);
    saloonContact = documentSnaphot.get(field_saloon_contact);
    saloonName = documentSnaphot.get(field_saloon_name);
    status = documentSnaphot.get(field_status);
    slotTime = documentSnaphot.get(field_slot_time);
    baberId = documentSnaphot.get(field_baber_id);
    services = documentSnaphot.get(field_client_services);
    createdAt = documentSnaphot.get(field_created_at);
    id = documentSnaphot.id;
    cost = documentSnaphot.get(field_cost);
    saloonId = documentSnaphot.get(field_saloon_id);
    clientPhone = documentSnaphot.get(field_client_phone);
  }

  Map<String, dynamic> toDocumentSnapshot(String clientNote, DateTime current) {
    return {
      field_client_name: client?.displayName,
      field_client_id: client?.uid,
      field_client_phone: client?.phoneNumber,
      field_client_note: clientNote,
      field_client_services: services,
      field_slot_time: slotTime,
      field_baber_id: baberId,
      field_baber_name: baberName,
      field_saloon_name: saloonName,
      field_status: field_entry_statuses[0],
      field_created_at: current,
      field_is_reviewed: false,
      field_saloon_contact: saloonContact,
      field_cost: cost,
      field_saloon_id: saloonId,
    };
  }
}
