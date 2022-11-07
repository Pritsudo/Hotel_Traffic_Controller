import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_traffic_controller/manager_part/screens/home_screen.dart';
import 'package:hotel_traffic_controller/resources/cloud_firestore_class.dart.dart';
import 'package:hotel_traffic_controller/user_part/model/booking_details_model.dart';
import 'package:hotel_traffic_controller/user_part/model/hotel_list_model.dart';
import 'package:hotel_traffic_controller/user_part/screens/app_drawer.dart';
import 'package:hotel_traffic_controller/user_part/screens/user_waiting_scree.dart';
import 'package:hotel_traffic_controller/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:hotel_traffic_controller/widgets/choose_button_widget.dart';
import 'package:hotel_traffic_controller/widgets/custom_button_widget.dart';
import 'package:hotel_traffic_controller/widgets/textFormField_widget.dart';

import 'package:provider/provider.dart';

class FillDetailsScreen extends StatefulWidget {
  var table_no;
  var hotelName;
  FillDetailsScreen({Key? key, required this.table_no, required this.hotelName})
      : super(key: key);

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
  final _dt = TextEditingController();
  late List l;
  String dateString = DateFormat('yyyy-MMMM-dd h:mm:a').format(DateTime.now());
  void _submitData(
      {required String name,
      required String phoneNumber,
      required String email,
      required int tableSize,
      required String date,
      required String arrivalTime,
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
        tableSize: int.parse(widget.table_no),
        date: l[0],
        arrivalTime: l[1],
        bookingStatus: 'Pending');

    await CloudFireStoreClass().uploadBookingDetails(
        bookingDetailsModel: bookingDetailsModel, hotelName: hotelName);
    print('/.......................... Process Finished....................');
      Navigator.pushNamed(context, UserWaitingScreen.routeName,arguments: bookingDetailsModel);
    //Navigator.pushNamed(context, UserWaitingScreen.routeName);
  }

  @override
  @override
  void initState() {
    _dt.text = dateString;
    super.initState();
  }

  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as HotelListModel;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xff3D7ABE)),
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
                    child: Column(children: [
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
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                        child: DateTimePicker(
                          type: DateTimePickerType.dateTimeSeparate,
                          dateMask: 'd MMMM, yyyy',
                          timePickerEntryModeInput: false,

                          controller: _dt,
                          //initialValue: DateTime.now().toString(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Date',
                          timeLabelText: "Hour",

                          onChanged: (val) {
                            //print(DateFormat('yyyy-MMMM-dd h:mm:a').format(DateTime.parse(val)));
                            val = DateFormat('yyyy-MMMM-dd h:mm:a')
                                .format(DateTime.parse(val))
                                .toString();
                            //l=val.split(' ');
                            _dt.text = val;

                            //return null;
                          },

                          // onChanged: (val) => print(val),
                          validator: (val) {
                            // _dt.text=_dt.text.split(' ').toString();
                            // print(_dt.text);

                            return null;
                          },
                          //onSaved: (val) => print(''),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ChooseButtonWidget(
                          //     title: 'Select Table',
                          //     function: () {},
                          //     icon: Icon(Icons.table_bar)),
                          SizedBox(
                            width: 5.w,
                          ),

                          SizedBox(
                            height: 40.h,
                          ),
                          CustomButtonWidget(
                              backgroundColor: Color(0xff3D7ABE),
                              function: () {
                                l = _dt.text.split(' ').toList();
                                print(l[0]);
                                print(l[1]);
                                _submitData(
                                    hotelName: widget.hotelName,
                                    name: nameController.text,
                                    phoneNumber: phoneNumberController.text,
                                    email: emailController.text,
                                    tableSize: 15,
                                    date: l[0],
                                    arrivalTime: l[1]);
                              },
                              title: 'Submit',
                              fntSize: 24.sp,
                              color: Colors.white)
                        ],
                      ),
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
