import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_traffic_controller/resources/cloud_firestore_class.dart.dart';
import 'package:hotel_traffic_controller/user_part/model/user_model.dart';

final firebaseAuth = FirebaseAuth.instance;
final firebaseStorage = FirebaseFirestore.instance;

class FirebaseAuthentication {
  CloudFireStoreClass cloudFireStoreClass = CloudFireStoreClass();
  Future<String> loginUser(String email, String password) async {
    email.trim();
    password.trim();

    if (email.isEmpty || password.isEmpty) {
      return "Please fill all the fields";
    } 
    // else if (!email.contains('@gmail.com')) {
    //   return "Enter valid email address";
    // }
     else if (password.length < 8) {
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
    } else if (!email.contains('@gmail.com')) {
      return "Enter valid email address";
    } else if (password.length < 8) {
      return "Password length must be greater than 8 character";
    } else if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

        final userId = firebaseAuth.currentUser!.uid;
        UserModel userModel =
            UserModel(userName: username, emailAddress: email, uid: userId);
        await cloudFireStoreClass.uploadUserData(userModel: userModel);
      } on FirebaseAuthException catch (e) {
        return e.message.toString();
      }
    }
    return 'success';
  }
}
