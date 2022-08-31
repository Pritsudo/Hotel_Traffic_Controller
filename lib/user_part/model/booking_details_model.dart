import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class BookingDetailsModel {
  final String uid;
  String orderStoredId;
  final String name;
  final String hotelName;
  final String email;
  final String phoneNumber;
  final int tableSize;
  final Timestamp date;
  final Timestamp arrivalTime;
  String bookingStatus;

  BookingDetailsModel(
      {required this.uid,
      required this.orderStoredId,
      required this.name,
      required this.hotelName,
      required this.email,
      required this.phoneNumber,
      required this.tableSize,
      required this.date,
      required this.arrivalTime,
      required this.bookingStatus});

  Map<String, dynamic> modelToJson() => {
        'useId': uid,
        'orderStoredId': orderStoredId,
        'userName': name,
        'hotelName':hotelName,
        'emailAddress': email,
        'phoneNumber': phoneNumber,
        'tableSize': tableSize,
        'date': date,
        'arrivalTime': arrivalTime,
        'bookingStatus': bookingStatus
      };

  static BookingDetailsModel fromSnap(DocumentSnapshot snap) {
    return BookingDetailsModel(
        uid: snap['useId'],
        orderStoredId: snap['orderStoredId'],
        name: snap['userName'],
        hotelName: snap['hotelName'],
        email: snap['emailAddress'],
        phoneNumber: snap['phoneNumber'],
        tableSize: snap['tableSize'],
        date: snap['date'],
        arrivalTime: snap['arrivalTime'],
        bookingStatus: snap['bookingStatus']);
  }
}

// // class BookingDetails with ChangeNotifier {
//   List<BookingDetailsModel> _bookingList = [];

//   List<BookingDetailsModel> get bookingList {
//     return [..._bookingList];
//   }

//   Future<void> fetchOrders({required String hotelName}) async {
//     // final docRef = await FirebaseFirestore.instance
//     //     .collection('Hotels Names')
//     //     .doc('testName1')
//     //     .collection('orders').where('bookingStatus' ,isEqualTo: 'Pending')
//     //     .snapshots()
//     //     .listen((snapshot) {
//     //   final snap = snapshot.docs;
//     //   List<BookingDetailsModel> temp = [];
//     //   for (int i = 0; i < snap.length; i++) {
//     //     temp.add(BookingDetailsModel(
//     //         uid: snap[i]['useId'],
//     //         orderStoredId: snap[i]['orderStoredId'],
//     //         name: snap[i]['userName'],
//     //         email: snap[i]['emailAddress'],
//     //         phoneNumber: snap[i]['phoneNumber'],
//     //         tableSize: snap[i]['tableSize'],
//     //         date: snap[i]['date'],
//     //         arrivalTime: snap[i]['arrivalTime'],
//     //         bookingStatus: snap[i]['bookingStatus']));
//     //   }
//     //   _bookingList = temp.toList();
//     //   notifyListeners();
//     //   print('Runned');
//     //   print(_bookingList.first);
//     //   print(_bookingList.length);
//     //   print(("current data: ${snap[i]['emailAddress']}"));
//     // });

//     QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
//         .instance
//         .collection('Hotels Names')
//         .doc('testName1')
//         .collection('orders')
//         .get();
//     List<BookingDetailsModel> temp = [];
//     for (int i = 0; i < snapshot.docs.length; i++) {
//       final snap = snapshot.docs[i].data();
//       temp.add(BookingDetailsModel(
//           uid: snap['useId'],
//           orderStoredId: snap['orderStoredId'],
//           name: snap['userName'],

//           email: snap['emailAddress'],
//           phoneNumber: snap['phoneNumber'],
//           tableSize: snap['tableSize'],
//           date: snap['date'],
//           arrivalTime: snap['arrivalTime'],
//           bookingStatus: snap['bookingStatus']));
//     }
//     _bookingList = temp;
//     print('................Checking for length.................');
//     print(_bookingList.length);
//     notifyListeners();
//     //   StreamBuilder(
//     //     builder: (context,
//     //         AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//     //       if (snapshot.connectionState == ConnectionState.waiting) {
//     //         return Center(
//     //           child: CircularProgressIndicator(),
//     //         );
//     //       }
//     //       List<DocumentSnapshot> dbData = snapshot.data!.docs;
//     //       dbData.forEach((DocumentSnapshot snap) {
//     //         print('Addind item');
//     //         _bookingList.add(BookingDetailsModel(
//     //             uid: snap['useId'],
//     //             orderStoredId: snap['orderStoredId'],
//     //             name: snap['userName'],
//     //             email: snap['email'],
//     //             phoneNumber: snap['phoneNumber'],
//     //             tableSize: snap['tableSize'],
//     //             date: snap['date'],
//     //             arrivalTime: snap['arrivalTime'],
//     //             bookingStatus: snap['bookingStatus']));
//     //       });
//     //       return ListView.builder(
//     //         itemBuilder: (context, index) {
//     //           return Center(
//     //             child: Text('done'),
//     //           );
//     //         },
//     //         itemCount: snapshot.data!.docs.length,
//     //       );
//     //     },
//     //     stream: FirebaseFirestore.instance
//     //         .collection('Hotels Names')
//     //         .doc('testName1')
//     //         .collection('orders')
//     //         .snapshots(),
//     //   );
//     //   // print('...................Methode running..............');
//     //   // QuerySnapshot<Map<String,dynamic>> data = await FirebaseFirestore.instance
//     //   //     .collection('Hotels Names')
//     //   //     .doc('testName1')
//     //   //     .collection('orders')
//     //   //     // .doc('91f1e8a0-27b4-11ed-af7d-cd4dd11365d3')
//     //   //     .get();
//     //   // data.docs.forEach((snap) {

//     //   //   });
//     //   // print(data.docs.length);

//     //   // for (int i = 0; i < data.docs.length;i++)
//     //   // {

//     //   // }

//     //   // data.map(
//     //   //   (event) {
//     //   //     _bookingList.add(BookingDetailsModel(
//     //   //         uid: data['uid'],
//     //   //         orderStoredId: orderStoredId,
//     //   //         name: name,
//     //   //         email: email,
//     //   //         phoneNumber: phoneNumber,
//     //   //         tableSize: tableSize,
//     //   //         date: date,
//     //   //         arrivalTime: arrivalTime,
//     //   //         bookingStatus: bookingStatus));
//     //   //   },
//     //   // );
//     //   // print(data);
//     //   // data.forEach((snap) {
//     //   //   print(snap['date']);
//     //   //   print(snap['emailAddress']);
//     //   //   print(snap['tableSize']);
//     //   //   print(snap['useId']);
//     //   // });
//     //   print('...................Methode running..  ............');
//     //   print('Lenght is /.............');
//     //   print(_bookingList.length);
//     //   // data.forEach((_, value) {
//     //   // });
//     // }

//     // List<BookingDetailsModel> getPendingBookingOrders(String hotelName) {

//     //   return _bookingList.where((bookList) => bookList.)
//     //   // final f = await FirebaseFirestore.instance
//     //   //     .collection('Hotels Names')
//     //   //     .doc(hotelName)
//     //   //     .collection('orders')
//     //   //     .where('orderStatus', isEqualTo: 'Pending')
//     //   //     .snapshots();

//     //   // f.forEach((snap) {
//     //   //   print(snap[]);
//     //   // });
//     // }
//   }
// }
