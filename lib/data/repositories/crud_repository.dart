import 'package:beautonomi/model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/client.dart';

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
  await categoriesCollection.add(client.toFirestore());
}

Future<Client> getUserFromFirestore(String id) async{
  final documentSnapshot = await userCollection.doc(id).get();
      return Client.fromFirestore(documentSnapshot: documentSnapshot);
}

void deleteCategoryFromFirestore(String id) async{
await categoriesCollection.doc(id).delete();
}

void addNewCategoryToFirestore(CateGory category) async {
  await categoriesCollection.add(category.toFirestore());
}