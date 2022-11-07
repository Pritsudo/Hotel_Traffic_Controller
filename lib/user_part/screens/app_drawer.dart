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
            decoration: BoxDecoration(
              color: Color(0xff3D7ABE)
            ),
            currentAccountPicture: FittedBox(
            fit: BoxFit.cover,
             child:   CircleAvatar(   
            backgroundImage:NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
          
           /* child: (_image != null)
                ? Image.file(_image!)
                : Image.asset('assets/images/images.jpg'),*/
          ),
      
            ),
              accountEmail: Text(user.email!), accountName: Text('Prit Dalsaniya')),
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
