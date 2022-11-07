import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_traffic_controller/resources/auth_function_class.dart';
import 'package:hotel_traffic_controller/user_part/screens/hotel_lists_screen.dart';

import 'package:hotel_traffic_controller/utils/utils.dart';
import 'package:hotel_traffic_controller/widgets/custom_button_widget.dart';
import 'package:hotel_traffic_controller/widgets/textFormField_widget.dart';

class AuthenticationScreen extends StatefulWidget {
  static const routName = 'authentication-screen';
  bool isLogin;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  AuthenticationScreen({
    Key? key,
    required this.isLogin,
  }) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.emailController.dispose();
    widget.passwordController.dispose();
    widget.userNameController.dispose();
    emailFocusNode.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  void loginSignupFun() async {
    print('Process Started');
    setState(() {
      isLoading = true;
    });
    if (widget.isLogin) {
      String authStatus = await FirebaseAuthentication().loginUser(
          widget.emailController.text, widget.passwordController.text);
      setState(() {
        isLoading = false;
      });
      if (authStatus != "success") {
        Utils().showSnackBar(context: context, content: authStatus);
      }
      if (authStatus == "success") {
        print('SuccessFully executed');
        Navigator.pushNamed(context, HotelListScreen.routName);
      }
    } else {
      setState(() {
        isLoading = true;
      });
      String authStatus = await FirebaseAuthentication().sigUpUser(
          widget.emailController.text,
          widget.passwordController.text,
          widget.userNameController.text);
      setState(() {
        isLoading = false;
      });
      if (authStatus != "success") {
        Utils().showSnackBar(context: context, content: authStatus);
      }
      if (authStatus == "success") {
        Navigator.pushNamed(context, HotelListScreen.routName);
      }
    }
  }

  @override
  int n = 1;
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    print('width : ${screenSize.width}');
    print('height : ${screenSize.height}');
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: SizedBox(
            width: double.infinity,
            height: screenSize.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height / 2.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r)),
                      child: const Image(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1625244724120-1fd1d34d00f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  if (widget.isLogin)
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 38.sp, fontWeight: FontWeight.bold),
                    ),
                  if (!widget.isLogin)
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 38.sp, fontWeight: FontWeight.bold),
                    ),
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
                      controller: widget.emailController),
                  if (!widget.isLogin)
                    SizedBox(
                      height: 20.h,
                    ),
                  if (!widget.isLogin)
                    TextInputFormWidget(
                        focusNode: usernameFocusNode,
                        text: 'UserName',
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 28.h,
                        ),
                        isPassword: false,
                        controller: widget.userNameController),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextInputFormWidget(
                      focusNode: passwordFocusNode,
                      text: 'Password',
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                        size: 28.h,
                      ),
                      isPassword: true,
                      controller: widget.passwordController),
                  SizedBox(height: 20.h),
                  if (widget.isLogin)
                    const Text(
                      'Forget Password?',
                      style: TextStyle(color: Color(0xffF33440), fontSize: 16),
                    ),
                  SizedBox(
                    height: 15.h,
                  ),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButtonWidget(
                          function: loginSignupFun,
                          backgroundColor: Color(0xffF33440),
                          title: widget.isLogin ? 'LOGIN' : 'Signup',
                          fntSize: 22,
                          color: Colors.white),
                  SizedBox(
                    height: 15.h,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: widget.isLogin
                          ? 'Not have an account ? '
                          : 'Already have an account ? ',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    if (widget.isLogin)
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              setState(() {
                                print('Text Span setstate for signup');
                                widget.isLogin = false;
                              });
                            },
                          text: 'Sign Up',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18)),
                    if (!widget.isLogin)
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              setState(() {
                                print('Text Span For Login');
                                widget.isLogin = true;
                              });
                            },
                          text: 'Login',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18)),
                  ]))
                ],
              ),
            )),
      ),
    );
  }
}
