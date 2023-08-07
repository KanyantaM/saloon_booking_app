import 'package:beautonomi/model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference baberCollection =
    FirebaseFirestore.instance.collection('baber');
final CollectionReference categoriesCollection =
    FirebaseFirestore.instance.collection('categories');

Future<List<CateGory>> getCategoriesFromFirestore () async{
  final querySnapshot = await baberCollection.get();
      return querySnapshot.docs
          .map((doc) => CateGory.fromFirestore(documentSnapshot: doc))
          .toList();
}

void deleteCategoryFromFirestore(String id) async{
await categoriesCollection.doc(id).delete();
}

void addNewCategoryToFirestore(CateGory category) async {
  await categoriesCollection.add(category.toFirestore());
}