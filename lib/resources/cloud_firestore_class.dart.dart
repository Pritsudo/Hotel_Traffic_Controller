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

 Future<void> changeOrderStatus(bool isAccepted, DocumentSnapshot snapshot)async{
    final String bookingStatus = isAccepted ? 'Accepted' : 'Decline';
    final userId = snapshot['useId'];
    final orderId = snapshot['orderStoredId'];

    final cloudManagerPath =
      firebaseStorage.collection('Hotels Names').doc('testName1');
    final cloudUserPath = firebaseStorage.collection('users').doc(userId);

    // var snapshot = snap.data() as Map<String, dynamic>;
    BookingDetailsModel bookingmodel = BookingDetailsModel(
        uid: snapshot['useId'],
        orderStoredId: snapshot['orderStoredId'],
        name: snapshot['userName'],
        hotelName: snapshot['hotelName'],
        email: snapshot['emailAddress'],
        phoneNumber: snapshot['phoneNumber'],
        tableSize: snapshot['tableSize'],
        date: snapshot['date'],
        arrivalTime: snapshot['arrivalTime'],
        bookingStatus: bookingStatus);

    //This is for changing status
   await cloudManagerPath.collection('orders').doc(orderId).update({
      'bookingStatus': bookingStatus,
    }).then((_) {
      cloudManagerPath
          .collection('booking history')
          .doc(orderId)
          .set(bookingmodel.modelToJson());
    }).whenComplete(
        () => cloudManagerPath.collection('orders').doc(orderId).delete());

    //This is for changing status
   await cloudUserPath.collection('orders').doc(orderId).update({
      'bookingStatus': bookingStatus,
    });
  }


  Future<void> uploadBookingDetails(
      {required BookingDetailsModel bookingDetailsModel,
      required String hotelName}) async {
    // This is Details for manager use

    // bookingDetailsModel.orderStoredId = uid;
    // Here will be one condition in which if user has booked table,
    // then there will be new entry of order.
    await firebaseStorage
        .collection('Hotels Names')
        .doc(hotelName)
        .collection('orders')
        .doc(bookingDetailsModel.orderStoredId)
        .set(bookingDetailsModel.modelToJson());

    // This is History for users

    // Here will be one condtion which check entry for manager
    await firebaseStorage
        .collection('users')
        .doc(bookingDetailsModel.uid)
        .collection('orders')
        .doc(bookingDetailsModel.orderStoredId)  
        .set(bookingDetailsModel.modelToJson());
    // .set(bookingDetailsModel.modelToJson());
  }
}
