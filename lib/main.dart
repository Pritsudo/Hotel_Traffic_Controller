import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hotel_traffic_controller/user_part/screens/authenticationScreen.dart';
import 'package:hotel_traffic_controller/user_part/screens/fill_details_screen.dart';
import 'package:hotel_traffic_controller/utils/utils.dart';
import 'package:provider/provider.dart';

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
              return
                  // MultiProvider(
                  // providers: [
                  //   ChangeNotifierProvider(
                  //     create: (_) => UserUid(),
                  //   )
                  // ],
                  // child:
                  MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: StreamBuilder(
                  builder: (context, AsyncSnapshot<User?> user) {
                    if (user.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.orange,
                        ),
                      );
                    } else if (user.hasData) {
                      return FillDetailsScreen();
                    }
                    return AuthenticationScreen(
                      isLogin: false,
                    );
                  },
                  stream: FirebaseAuth.instance.authStateChanges(),
                ),
                routes: {
                  // '/':(context) =>
                },
                // ),
              );
            },
          );
        });
  }
}
