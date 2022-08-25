import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_traffic_controller/user_part/model/booking_details_model.dart';
import 'package:hotel_traffic_controller/user_part/model/user_model.dart';


final firebaseAuth = FirebaseAuth.instance;
final firebaseStorage = FirebaseFirestore.instance;

class CloudFireStoreClass {
  Future uploadUserData({required UserModel userModel}) async {
    await firebaseStorage
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.modelToJson());
  }

  Future uploadBookingDetails(
      {required BookingDetailsModel bookingDetailsModel}) async {
    
    // This is Details for manager use

    // bookingDetailsModel.orderStoredId = uid;
    // Here will be one condition in which if user has booked table,
    //then there will be new entry of order.
    await firebaseStorage
        .collection('orders')
        .doc(bookingDetailsModel.orderStoredId)
        .set(bookingDetailsModel.modelToJson());

    // This is History for users

    // Here will be one condtion which check entry for manager
    await firebaseStorage
        .collection('users')
        .doc(bookingDetailsModel.uid)
        .collection('orders')
        .add(bookingDetailsModel.modelToJson());
    // .set(bookingDetailsModel.modelToJson());
  }
}
