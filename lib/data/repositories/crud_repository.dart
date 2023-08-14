import 'package:beautonomi/model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/client.dart';

final String userID = FirebaseAuth.instance.currentUser!.uid;

final CollectionReference baberCollection =
    FirebaseFirestore.instance.collection('babers');
final CollectionReference categoriesCollection =
    FirebaseFirestore.instance.collection('categories');
final CollectionReference userCollection =
    FirebaseFirestore.instance.collection('users');

Future<List<CateGory>> getCategoriesFromFirestore () async{
  final querySnapshot = await baberCollection.get();
      return querySnapshot.docs
          .map((doc) => CateGory.fromFirestore(documentSnapshot: doc))
          .toList();
}

void deleteUserFromFirestore(String id) async{
await userCollection.doc(id).delete();
}

void addNewUserToFirestore(Client client) async {
  await userCollection.doc(userID).set(client.toFirestore());
}

Future<Client> getUserFromFirestore() async{
  final documentSnapshot = await userCollection.doc(userID).get();
      return Client.fromFirestore(documentSnapshot: documentSnapshot);
}

void deleteCategoryFromFirestore(String id) async{
await categoriesCollection.doc(id).delete();
}

void addNewCategoryToFirestore(CateGory category) async {
  await categoriesCollection.add(category.toFirestore());
}