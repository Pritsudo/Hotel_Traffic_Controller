import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_traffic_controller/resources/cloud_firestore_class.dart.dart';

class UserHistoryScreen extends StatefulWidget {
  const UserHistoryScreen({Key? key}) : super(key: key);
  static const routeName = '/History-Screen';
  @override
  State<UserHistoryScreen> createState() => _UserHistoryScreenState();
}

class _UserHistoryScreenState extends State<UserHistoryScreen> {

  @override
  Widget build(BuildContext context) {
    String? userId;
    userId = FirebaseAuth.instance.currentUser!.uid;

    final firebaseStorage = FirebaseFirestore.instance;
    final cloudFirstoreRef = CloudFireStoreClass();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3D7ABE),
        title: Text('HomeScreen'),
      ),
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
              print('Entered Here');
              print(dbData['hotelName']);
              return Card(
                color: Color(0xffD9D9D9),
                // margin: EdgeInsets.symmetric(horizontal: 5,vertical:20 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name ${dbData['hotelName']}'),
                  ],
                ),
              );
            },
            itemCount: snapshot.data!.docs.length,
          );
        },
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('orders')
            .snapshots(),
      ),
    );
  }
}
