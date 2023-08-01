import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository{
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUP({required String email, required String password}) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        throw Exception(e.code);
      } else if(e.code == 'email-already-in-use'){
        throw Exception('An account with that email already exists');
      }
    } catch(e){
      throw  Exception(e.toString());
    }
  }

  Future<void> signIn({required String email, required String password}) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      if (e.code == 'user-not-found'){
        throw Exception('No user found for that email');
      } else if(e.code == 'wrong-password'){
        throw Exception('Password does not match email');
      }
    }
  }

  Future<void> signOut() async{
    try{
      await _firebaseAuth.signOut();
    } catch (e){
      throw Exception(e);
    }
  }

  Future<void> signInWithGoogle() async{
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(accessToken:googleAuth?.accessToken, idToken: googleAuth?.idToken,);
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch(e){
      throw Exception(e.toString());
    }
  }
  Future<void> signInWithFacebook() async{
    try{
      //TODO: Sign in with Facebook
    } catch(e){
      throw Exception(e.toString());
    }
  }
  Future<void> signInWithApple() async{
    try{
      //TODO: add sigh in with apple
    } catch(e){
      throw Exception(e.toString());
    }
  }

}