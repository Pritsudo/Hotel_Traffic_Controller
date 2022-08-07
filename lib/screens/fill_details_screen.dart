import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_traffic_controller/widgets/choose_button_widget.dart';
import 'package:hotel_traffic_controller/widgets/custom_button_widget.dart';
import 'package:hotel_traffic_controller/widgets/textFormField_widget.dart';

class FillDetailsScreen extends StatefulWidget {
  const FillDetailsScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
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
                              icon: Icon(Icons.edit_calendar)),
    
    
                        ],
                      ),
                          SizedBox(height: 40.h,),
                          CustomButtonWidget(backgroundColor: Color(0xffF33440), function: (){}, title: 'Submit', fntSize: 24.sp, color: Colors.white)    
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
