import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final auth  = FirebaseAuth.instance;

  bool hasCurrentUser(){
    return auth.currentUser != null;
  }

  User requireCurrentUser(){
      return auth.currentUser! ;
  }
  User? getCurrentUser(){
      return auth.currentUser;
  }

  Future<String> login(String email, String password) async {
    print(email);
    print(password);
    try{
     await auth.signInWithEmailAndPassword(email: email, password: password);
     return "success";
    } on FirebaseAuthException catch (e) {
      return e.code;
      /*if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }*/
    }
  }

  Future<String> signUp(String email, String password) async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

}