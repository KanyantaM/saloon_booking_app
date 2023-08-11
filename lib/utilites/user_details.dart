import 'package:firebase_auth/firebase_auth.dart';

import '../data/repositories/crud_repository.dart';
import '../model/client.dart';

late Client user;
Future<void> settingser() async{
    String id = FirebaseAuth.instance.currentUser!.uid;
    user = await getUserFromFirestore(id);
} 