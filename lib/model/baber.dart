import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/firebase_constants.dart';

class Baber {
  late Map<String, double> services;
  late String saloon;
  late String profileURL;
  late String saloonId;
  late String name;
  String? baberId;
  late String contact;
  late String bio;
  late int reviewCount;
  late int totalRating;
  double avgRating() => totalRating / reviewCount;

  Baber({
    required this.saloonId,
    required this.reviewCount,
    required this.contact,
    required this.name,
    required this.services,
    required this.saloon,
    required this.profileURL,
    this.baberId,
  });

  Baber.fromFirestore({required DocumentSnapshot documentSnapshot}) {
    services =
        Map<String, double>.from(documentSnapshot.get(field_baber_services));
    name = documentSnapshot.get(field_baber_name);
    bio = documentSnapshot.get(field_baber_bio);
    contact = documentSnapshot.get(field_baber_contact);
    saloon = documentSnapshot.get(field_baber_saloon);
    profileURL = documentSnapshot.get(field_baber_profileUrl);
    baberId = documentSnapshot.id;
    reviewCount = documentSnapshot.get(field_baber_reviewCount);
    totalRating = documentSnapshot.get(field_baber_totalRating);
    saloonId = documentSnapshot.get(field_baber_saloon_id);
  }

  Map<String, dynamic> toFirestore() {
    return {
      field_baber_services: services,
      field_baber_name : name,
      field_baber_bio : bio,
      field_baber_contact : contact,
      field_baber_saloon : saloon,
      field_baber_profileUrl : profileURL,
      field_baber_reviewCount : reviewCount,
      field_baber_totalRating : totalRating,
      field_baber_saloon_id : saloonId,
    };
  }
}
