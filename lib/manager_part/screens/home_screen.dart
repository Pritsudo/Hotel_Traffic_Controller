// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final firebaseStorage = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body:  StreamBuilder(builder: 
//       (context, snapshot) {
//         if(snapshot.hasData)
//         {

//         }
//       },
//       stream: firebaseStorage.collection('orders').snapshots(),
//       ),
//     );
//   }
// }
