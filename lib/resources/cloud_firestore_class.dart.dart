import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_traffic_controller/model/user_model.dart';


final firebaseAuth = FirebaseAuth.instance;
final firebaseStorage = FirebaseFirestore.instance;

class CloudFireStoreClass{
 Future uploadUserData({required UserModel userModel}) async
  {
  await firebaseStorage.collection('users').doc(userModel.uid).set(userModel.modelToJson());
  }
}