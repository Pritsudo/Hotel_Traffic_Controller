import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_traffic_controller/manager_part/screens/home_screen.dart';
import 'package:hotel_traffic_controller/resources/cloud_firestore_class.dart.dart';
import 'package:hotel_traffic_controller/user_part/model/booking_details_model.dart';
import 'package:hotel_traffic_controller/user_part/model/hotel_list_model.dart';
import 'package:hotel_traffic_controller/user_part/screens/hotel_lists_screen.dart';
import 'package:hotel_traffic_controller/user_part/screens/user_waiting_scree.dart';
import 'package:hotel_traffic_controller/utils/utils.dart';
import 'package:uuid/uuid.dart';
import 'package:hotel_traffic_controller/widgets/choose_button_widget.dart';
import 'package:hotel_traffic_controller/widgets/custom_button_widget.dart';
import 'package:hotel_traffic_controller/widgets/textFormField_widget.dart';

import 'package:provider/provider.dart';

class FillDetailsScreen extends StatefulWidget {
  // final HotelListModel hotelListModel;
  const FillDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/fillDetail-Screen';

  @override
  State<FillDetailsScreen> createState() => _FillDetailsScreenState();
}

class _FillDetailsScreenState extends State<FillDetailsScreen> {
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  void _submitData(
      {required String name,
      required String phoneNumber,
      required String email,
      required int tableSize,
      required DateTime date,
      required Timestamp arrivalTime,
      required String hotelName}) async {
    
    // await BookingDetails().fetchOrders(hotelName : 'testName1');

    if (name.isEmpty &&
        phoneNumber.isEmpty &&
        email.isEmpty &&
        tableSize == null &&
        date == null &&
        arrivalTime == null &&
        hotelName == null) {
      // Here will be some dialog box which show error

    } else if (phoneNumber.length != 9 && phoneNumber.length < 0) {
      //Condition
    } else if (date.isBefore(DateTime.now())) {
      // Enter valid date
    }
    final userId =
        await Provider.of<UserUid>(context, listen: false).getUserId();
    final orderStorderId = const Uuid().v1();

    print(orderStorderId);
    print('Order is not printed yet');
    BookingDetailsModel bookingDetailsModel = BookingDetailsModel(

        uid: userId,
        orderStoredId: orderStorderId,
        name: name,
        hotelName: hotelName,
        email: email,
        phoneNumber: phoneNumber,
        tableSize: tableSize,
        date: arrivalTime,
        arrivalTime: arrivalTime,
        bookingStatus: 'Pending');

    await CloudFireStoreClass().uploadBookingDetails(
        bookingDetailsModel: bookingDetailsModel, hotelName: hotelName);
    print('/.......................... Process Finished....................');
    Navigator.pushNamed(context, UserWaitingScreen.routeName,arguments: bookingDetailsModel);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HotelListModel;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xffF33440)),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 550.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 14.h),
                    child: Text(
                      'Details',
                      style: TextStyle(fontSize: 24.sp),
                    )),
                SizedBox(
                  height: 500.h,
                  child: Column(
                    children: [
                      TextInputFormWidget(
                          focusNode: nameFocusNode,
                          text: 'Name',
                          icon: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 28.h,
                          ),
                          isPassword: false,
                          controller: nameController),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextInputFormWidget(
                          focusNode: emailFocusNode,
                          text: 'Email',
                          icon: Icon(
                            Icons.email,
                            color: Colors.black,
                            size: 28.h,
                          ),
                          isPassword: false,
                          controller: emailController),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextInputFormWidget(
                          focusNode: phoneNumberFocusNode,
                          text: 'Phone Number',
                          icon: Icon(
                            Icons.phone,
                            color: Colors.black,
                            size: 28.h,
                          ),
                          isPassword: false,
                          controller: phoneNumberController),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ChooseButtonWidget(
                              title: 'Select Table',
                              function: () {},
                              icon: Icon(Icons.table_bar)),
                          SizedBox(
                            width: 5.w,
                          ),
                          ChooseButtonWidget(
                              title: 'Choose Date',
                              function: () {},
                              icon: const Icon(Icons.edit_calendar)),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ChooseButtonWidget(
                          title: 'Time',
                          function: () {},
                          icon: const Icon(Icons.lock_clock)),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomButtonWidget(
                          backgroundColor: Color(0xffF33440),
                          function: () => _submitData(
                              hotelName: args.hotelName,
                              name: nameController.text,
                              phoneNumber: phoneNumberController.text,
                              email: emailController.text,
                              tableSize: 15,
                              date: DateTime(2014, 9, 7, 17, 30),
                              arrivalTime: Timestamp(10, 1212)),
                          title: 'Submit',
                          fntSize: 24.sp,
                          color: Colors.white)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
