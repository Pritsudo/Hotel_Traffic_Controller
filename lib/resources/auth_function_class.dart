import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firebaseAuth = FirebaseAuth.instance;
final firebaseStorage = FirebaseFirestore.instance;

class FirebaseAuthentication {
  Future<String> loginUser(String email, String password) async {
    email.trim();
    password.trim();

    if (email.isEmpty || password.isEmpty) {
      return "Please fill all the fields";
    } else if (!email.contains('@')) {
      return "Email address is not valid";
    } else if (password.length < 8) {
      return "Password length must be greater than 8 character";
    } else if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } on FirebaseAuthException catch (e) {
        return e.message.toString();
      }
    }
    return 'success';
  }

  Future<String> sigUpUser(
      String email, String password, String username) async {
    email.trim();
    password.trim();
    username.trim();

    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      return "Please fill all the fields";
    } else if (!email.contains('@')) {
      return "Email is not valid";
    } else if (password.length < 8) {
      return "Password length must be greater than 8 character";
    } else if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
      } on FirebaseAuthException catch (e) {
        return e.message.toString();
      }
    }
    return 'success';
  }
}
