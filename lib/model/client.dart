import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  late String? id;
  late String email;
  late String phone;

  Client(
      {required this.phone,
      required this.email,
      this.id,});

      Client.fromFirestore({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    email = documentSnapshot.get('email');
    phone = documentSnapshot.get('phone');
  }

  Map<String, dynamic> toFirestore() {
    return {
      'phone' : phone,
      'email' : email,
    };
  }
}
