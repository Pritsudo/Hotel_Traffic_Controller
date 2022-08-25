import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Utils {
  showSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }
}

// class UserUid with ChangeNotifier {
//   Future<String> getUserId() async {
//     String uid = FirebaseAuth.instance.currentUser!.uid;
//     notifyListeners();
//     return uid;
//   }
// }
