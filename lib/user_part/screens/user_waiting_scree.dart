import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_traffic_controller/user_part/model/booking_details_model.dart';

class UserWaitingScreen extends StatefulWidget {
  const UserWaitingScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = 'user-waiting';

  @override
  State<UserWaitingScreen> createState() => _UserWaitingScreenState();
}

class _UserWaitingScreenState extends State<UserWaitingScreen> {
  @override
  Widget build(BuildContext context) {
    final bookingDetailsModel =
        ModalRoute.of(context)!.settings.arguments as BookingDetailsModel;

    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(bookingDetailsModel.uid)
            .collection('orders')
            .doc(bookingDetailsModel.orderStoredId)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          }
          var userDocument = snapshot.data['bookingStatus'];
          if (userDocument == 'Pending') {
            return Text('Wait until Accept or Decline your Request');
          }
          return Text(userDocument);
          // return ListView.builder(
          //   itemBuilder: (context, index) {
          //     final snap = snapshot.data;
          //     final dbData = snap[index].data();
          //     return Card(
          //       child: Column(
          //         children: [
          //           Text("Status : ${dbData['bookingStatus']}"),
          //           Text("email : ${dbData['emailAddress']}"),
          //           Text("orderStoredId : ${dbData['orderStoredId']}"),
          //           Text("PhoneNumber : ${dbData['phoneNumber']}"),
          //         ],
          //       ),
          //     );
          //   },
          //   itemCount: (snapshot.data as Map<String, dynamic>).length,
          // );
        },
      ),
    );
  }
}
