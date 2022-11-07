import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_traffic_controller/user_part/model/booking_details_model.dart';
import 'package:hotel_traffic_controller/user_part/model/hotel_list_model.dart';
import 'package:hotel_traffic_controller/user_part/screens/app_drawer.dart';
import 'package:hotel_traffic_controller/user_part/screens/fill_details_screen.dart';
import 'package:hotel_traffic_controller/widgets/hotel_list_card_widget.dart';

import 'hotel_details.dart';

class HotelListScreen extends StatefulWidget {
  const HotelListScreen({Key? key}) : super(key: key);

  static const routName = 'hotel-list-screen';

  @override
  State<HotelListScreen> createState() => _HotelListScreenState();
}

double calculaterating(int ratingvalue, int personcount) {
  if (ratingvalue == 0.0 || personcount == 0.0) {
    return 0.0;
  } else {
    double x = ratingvalue / personcount;

    return x;
  }
}

class _HotelListScreenState extends State<HotelListScreen> {
  late int ratevalue;
  late int personvalue;
  late double fratevalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3D7ABE),
        elevation: 0,
      ),
      drawer: AppDrawer(),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Hotels Names')
              .orderBy(
                'name',
              )
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              // searchList = streamSnapshot;
              for (int i = 0; i < streamSnapshot.data!.docs.length; i++) {
                ratevalue = streamSnapshot.data!.docs[i]['Ratings']['rating'];
                personvalue =
                    streamSnapshot.data!.docs[i]['Ratings']['person count'];
                // print(personvalue);
                fratevalue = calculaterating(ratevalue, personvalue);
                //ratevalue['current value']:fratevalue
                FirebaseFirestore.instance
                    .collection('Hotels Names')
                    .doc(streamSnapshot.data!.docs[i].id)
                    .update({'Ratings.${'current rating'}': fratevalue});
              }
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () =>  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => HotelDetails(
                                                            val: streamSnapshot.data!.docs[index]['table list'],index:index,
                                                           
                                                          ),),),
              
                    child: HotelListCardWidget(
                        hotelName: streamSnapshot.data!.docs[index]['name'],
                        currentRating: streamSnapshot.data!.docs[index]['Ratings']['current rating'],
                        address: streamSnapshot.data!.docs[index]['address'],
                
                        )
                  );
                },
                
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
