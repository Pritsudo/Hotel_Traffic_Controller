import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final firebaseStorage = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8.0),
                elevation: 1.2,
                child: Column(
                  children: [Text('name : ${snapshot.data!.docs[index].data()}'),
                  Divider(color: Colors.red),
                  ],
                ),
              );
            },
            itemCount: snapshot.data!.docs.length,
          );
        },
        stream: firebaseStorage.collection('orders').snapshots(),
      ),
    );
  }
}
