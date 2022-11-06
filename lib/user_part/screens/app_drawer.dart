import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_traffic_controller/user_part/screens/authenticationScreen.dart';
import 'package:hotel_traffic_controller/user_part/screens/history_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  User user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountEmail: Text(user.email!), accountName: Text('ghghg')),
          ListTile(
            //Icons.room_outlined,
            leading: const Icon(Icons.apartment),
            title: const Text('History'),
            onTap: () =>
                Navigator.pushNamed(context, UserHistoryScreen.routeName),
          ),
          const ListTile(
            leading: const Icon(Icons.report),
            title: const Text('Settings'),
          ),

          /* ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Settings'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),*/
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sign Out'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, AuthenticationScreen.routName,
                  arguments: false);
            },
          ),
        ],
      ),
    );
  }
}
