import 'package:flutter/material.dart';
import 'package:hotel_traffic_controller/user_part/model/booking_details_model.dart';
import 'package:hotel_traffic_controller/user_part/model/hotel_list_model.dart';
import 'package:hotel_traffic_controller/user_part/screens/app_drawer.dart';
import 'package:hotel_traffic_controller/user_part/screens/fill_details_screen.dart';
import 'package:hotel_traffic_controller/widgets/hotel_list_card_widget.dart';

class HotelListScreen extends StatelessWidget {
  const HotelListScreen({Key? key}) : super(key: key);

  static const routName = 'hotel-list-screen';

  @override
  
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3D7ABE),
        elevation: 0,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
    
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, FillDetailsScreen.routeName,
                arguments: hotelList[index]),
            child:
                HotelListCardWidget(hotelListModel: hotelList[index], key: key),
          );
        },
        itemCount: hotelList.length,
      ),
    );
  }
}
