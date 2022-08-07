import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hotel_traffic_controller/screens/fill_details_screen.dart';
import './screens/authenticationScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 737.4545454545455),
      builder: (context, child) {
        return ScreenUtilInit(
          builder: (context, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home:
                   FillDetailsScreen(),
              //     AuthenticationScreen(
              //   isLogin: false,
              // ),
              routes: {
                // '/':(context) =>
              },
            );
          },
        );
      },
    );
  }
}
