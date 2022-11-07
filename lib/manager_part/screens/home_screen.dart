import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_traffic_controller/resources/cloud_firestore_class.dart.dart';
import 'package:hotel_traffic_controller/user_part/model/booking_details_model.dart';
import 'package:hotel_traffic_controller/widgets/order_pending_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final firebaseStorage = FirebaseFirestore.instance;
  final cloudFirstoreRef = CloudFireStoreClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff3D7ABE),),
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
                color: Color(0xffD9D9D9),
                // margin: EdgeInsets.symmetric(horizontal: 5,vertical:20 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderPendingCard(
                        hotelName: dbData['hotelName'],
                        phoneNumber: dbData['phoneNumber'],
                        tableSize: dbData['tableSize'],
                        date: dbData['date'],
                        time: dbData['arrivalTime']),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          onPressed: () async =>
                              await cloudFirstoreRef.changeOrderStatus(
                            true,
                            snap[index],
                          ),
                          color: Color(0xff3DB93B),
                          child: const Text('Accept'),
                        ),
                        RaisedButton(
                            onPressed: () async =>
                                await cloudFirstoreRef.changeOrderStatus(
                                  false,
                                  snap[index],
                                ),
                            color: Color(0xffF62A1D),
                            child: const Text('Decline')),
                      ],
                    )
                  ],
                ),
              );
            },
            itemCount: snapshot.data!.docs.length,
          );
        },
        stream: FirebaseFirestore.instance
            .collection('Hotels Names')
            .doc('Hotel Rajpalace')
            .collection('orders')
            .snapshots(),
      ),
    );
  }
}
