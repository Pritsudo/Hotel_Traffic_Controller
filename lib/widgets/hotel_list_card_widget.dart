import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_traffic_controller/user_part/model/hotel_list_model.dart';

class HotelListCardWidget extends StatelessWidget {
  final String hotelName;
  final String address;
  
  final double currentRating;


  const HotelListCardWidget({
    required this.hotelName,
    required this.address,
    required this.currentRating,
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Card(
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image(image: NetworkImage('https://images.unsplash.com/photo-1625244724120-1fd1d34d00f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  hotelName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  address,
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 30.h,
                          width: 120.w,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              bool ratingNumber = index < currentRating;
                              return Icon(
                                Icons.star,
                                color: ratingNumber
                                    ? Colors.pink
                                    : Colors.grey[500],
                              );
                            },
                            itemCount: 5,
                          ),
                        ),
                        Text(
                          currentRating.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: Text('Full',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)),
                    ),
                  ],
                )
              ],
            ),
          ),
          // const Icon(
          //   Icons.more_vert,
          //   size: 16.0,
          // ),
        ],
      ),
    );
  }
}
