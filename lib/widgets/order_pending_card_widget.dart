import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPendingCard extends StatelessWidget {
  String hotelName;
  String phoneNumber;
  int tableSize;
  String date;
  String time;

   OrderPendingCard({
    Key? key,
    required this.hotelName,
    required this.phoneNumber,
    required this.tableSize,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      height: 148.h,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                    Text("Hotel Name : $hotelName",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 5.h,),
                    Text("Phone Number : $phoneNumber",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 5.h,),
                    Text("Table Size : $tableSize",style: TextStyle(fontSize: 20)),
                    SizedBox(height: 5.h,),
                    Text("Date : $date",style: TextStyle(fontSize: 20)),
                    SizedBox(height: 5.h,),
                    Text("Time : $time",style: TextStyle(fontSize: 20)),
                    SizedBox(height: 5.h,),
                  ],
        ),
      ),
    );
  }
}
