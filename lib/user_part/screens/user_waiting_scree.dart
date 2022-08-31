import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hotel_traffic_controller/user_part/model/booking_details_model.dart';
import 'package:hotel_traffic_controller/utils/utils.dart';

class UserWaitingScreen extends StatefulWidget {
  static const routeName = '/user-waiting';

  const UserWaitingScreen({
    Key? key,
    // required this.bookingDetailsModel,
  }) : super(key: key);

  @override
  @override
  State<UserWaitingScreen> createState() => _UserWaitingScreenState();
}

class _UserWaitingScreenState extends State<UserWaitingScreen> {
  Widget build(BuildContext context) {
    BookingDetailsModel bookingDetailsModel =
        ModalRoute.of(context)!.settings.arguments as BookingDetailsModel;
    String userId =
        Provider.of<UserUid>(context, listen: false).getUserId().toString();
    final firestore = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            
            return ListView.builder(
              itemBuilder: (context, index) {
                final snap = snapshot.data! as Map<String, dynamic>;
                final dbData = snap[index].data();
                return Card(
                  child: Column(
                    children: [
                      Text("Status : ${dbData['bookingStatus']}"),
                      Text("email : ${dbData['emailAddress']}"),
                      Text("orderStoredId : ${dbData['orderStoredId']}"),
                      Text("PhoneNumber : ${dbData['phoneNumber']}"),
                    ],
                  ),
                );
              },
              itemCount: (snapshot.data as Map<String, dynamic>).length,
            );
          },
          stream: firestore
              .collection('users')
              .doc(bookingDetailsModel.uid)
              .collection('orders')
              .doc(bookingDetailsModel.orderStoredId)
              .snapshots()),
    );
  }
}
