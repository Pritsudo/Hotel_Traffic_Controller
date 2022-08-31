import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_traffic_controller/user_part/model/hotel_list_model.dart';

class HotelListCardWidget extends StatelessWidget {
  final HotelListModel hotelListModel;

  const HotelListCardWidget({
    required this.hotelListModel,
    required Key? key,
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
              child: Image(image: NetworkImage(hotelListModel.url)),
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
                  hotelListModel.hotelName,
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
                  hotelListModel.address,
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
                              bool ratingNumber = index < hotelListModel.rating;
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
                          hotelListModel.rating.toString(),
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
