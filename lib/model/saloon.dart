import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/firebase_constants.dart';

class Saloon {
  late String email;
  late String phone;
  String? saloonId;
  late String name;
  late String logoUrl;
  late double totalRating;
  late double reviewCount;
  late List<String> saloonImages;
  late List<String> serviceImages;
  late Map<String, double> services;
  late GeoPoint location;
  late String address;
  late String about;
  double avgRating() => totalRating / reviewCount;

  Saloon({
    required this.phone,
    required this.email,
    required this.reviewCount,
    required this.serviceImages,
    required this.about,
    this.saloonId,
    required this.saloonImages,
    required this.name,
    required this.logoUrl,
    required this.totalRating,
    required this.location,
    required this.address,
    required this.services,
  });

  Saloon.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    saloonId = documentSnapshot.id;
    services = Map<String, double>.from(
        documentSnapshot.get(field_saloon_services).cast<String, double>());
    email = documentSnapshot.get(field_saloon_email);
    phone = documentSnapshot.get(field_saloon_contact);
    name = documentSnapshot.get(field_saloon_name);
    logoUrl = documentSnapshot.get(field_saloon_logo);
    serviceImages = List<String>.from(
        documentSnapshot.get(field_saloon_serviceImages).cast<String>());
    totalRating = documentSnapshot.get(field_saloon_totalRating);
    saloonImages = List<String>.from(
        documentSnapshot.get(field_saloon_images).cast<String>());
    address = documentSnapshot.get(field_saloon_address);
    about = documentSnapshot.get(field_saloon_about);
    location = documentSnapshot.get(field_saloon_location);
    reviewCount = documentSnapshot.get(field_saloon_reviewsCount);
  }
}
