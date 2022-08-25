import 'package:flutter/material.dart';
import 'package:hotel_traffic_controller/widgets/hotel_list_card_widget.dart';


class HotelListScreen extends StatelessWidget {
  const HotelListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return HotelListCardWidget();
        },
        itemCount: 10,
      ),
    );
  }
}
