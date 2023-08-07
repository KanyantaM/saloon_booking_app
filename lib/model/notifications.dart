import 'package:cloud_firestore/cloud_firestore.dart';

class AssignmentNotification {
  late bool? viewed;
  late String clientId;
  late String clientName;
  late String baberId;
  late String baberName;
  late String saloonName;
  late String saloonId;
  late String title;
  late String message;
  late Map<String, double>? services;
  late String? id;

  AssignmentNotification({
    this.viewed,
    required this.clientId,
    required this.clientName,
    required this.baberId,
    required this.baberName,
    required this.message,
    required this.saloonId,
    required this.saloonName,
    this.services,
    required this.title,
    this.id,
  });

  AssignmentNotification.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    clientId = documentSnapshot.get('client_id');
    clientName = documentSnapshot.get('client_name');
    baberId = documentSnapshot.get('baber_id');
    baberName = documentSnapshot.get('baber_name');
    message = documentSnapshot.get('message');
    saloonId = documentSnapshot.get('saloon_id');
    saloonName = documentSnapshot.get('saloon_name');
    services = documentSnapshot.get('services');
    title = documentSnapshot.get('title');
    id = documentSnapshot.id;
    viewed = documentSnapshot.get('is_viewed');
  }

  Map<String, dynamic> toDocumentSnapshot() {
    return {
      'client_id': clientId,
      'title': title,
      'cancel_reason': message,
      'client_name': clientName,
      'baber_id': baberId,
      'baber_name': baberName,
      'message': message,
      'saloon_id': saloonId,
      'saloon_name': saloonName,
      'services': services,
      'is_viewd': viewed,
    };
  }
}
