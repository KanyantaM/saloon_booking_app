import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/firebase_constants.dart';

class CateGory {
  late String image;
  late String title;
  late double price;
  String? id;

  CateGory({required this.image, required this.title, required this.price, this.id});

  CateGory.fromFirestore({required DocumentSnapshot documentSnapshot}) {
    title = documentSnapshot.get(field_category_title);
    image = documentSnapshot.get(field_category_image);
    price = documentSnapshot.get(field_category_price);
    id = documentSnapshot.id;
  }

  Map<String, dynamic> toFirestore() {
    return {
      field_category_title: title,
      field_category_image : image,
      field_category_price : price,
    };
  }

}