import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_traffic_controller/resources/cloud_firestore_class.dart.dart';
import 'package:hotel_traffic_controller/user_part/model/booking_details_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final firebaseStorage = FirebaseFirestore.instance;
  final cloudFirstoreRef =CloudFireStoreClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        
          return ListView.builder(
            itemBuilder: (context, index) {
              final snap = snapshot.data!.docs;
              final dbData = snap[index].data();
              return Card(
                child: Column(
                  children: [
                    Text("Status : ${dbData['bookingStatus']}"),
                    Text("email : ${dbData['emailAddress']}"),
                    Text("orderStoredId : ${dbData['orderStoredId']}"),
                    Text("PhoneNumber : ${dbData['phoneNumber']}"),
                    TextButton(
                        onPressed: () async => await cloudFirstoreRef.changeOrderStatus(
                              true,
                              snap[index],
                            ),
                        child: const Text('Accept')),
                    TextButton(
                        onPressed: () async => await cloudFirstoreRef.changeOrderStatus(
                              false,
                              snap[index],
                            ),
                        child: const Text('Decline')),
                  ],
                ),
              );
            },
            itemCount: snapshot.data!.docs.length,
          );
        },
        stream: FirebaseFirestore.instance
            .collection('Hotels Names')
            .doc('testName1')
            .collection('orders')
            .snapshots(),
      ),
    );
  }
}
