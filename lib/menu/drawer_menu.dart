import 'package:ekaksha/home/login/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/profile/profile_screen.dart';
import '../main.dart';
import 'widget/header_drawer_menu.dart';
import 'widget/item_drawer_menu.dart';
// _auth.signOut();
// Navigator.pop(context);

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DrawerMenuHeader(MyApp.studentModel),
          DrawerMenuItem(
            icon: Icons.account_circle_rounded, //assignment
            title: 'profile',
            callback: () {
              Navigator.pushNamed(context, ProfileScreen.route);
            },
          ),
          DrawerMenuItem(
            // icon: Icons.class_outlined,
            icon: Icons.class_rounded,
            title: 'classes',
            callback: () => Navigator.of(context).pop(),
          ),
          const Divider(),
          DrawerMenuItem(
            icon: Icons.notifications_rounded,
            title: 'announcement',
            callback: () {},
          ),
          const Divider(),
          DrawerMenuItem(
            icon: Icons.logout_rounded,
            title: 'logout',
            callback: () {
              FirebaseAuth.instance.signOut();
              Scaffold.of(context).closeDrawer();
              Navigator.popAndPushNamed(context, WelcomeScreen.route);
            },
          ),
        ],
      ),
    );
  }
}
