import 'package:ekaksha/home/welcome_screen.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/profile/tab_screen.dart';
import '../main.dart';
import 'widget/header_drawer_menu.dart';
import '../utils/widget/leading_icon_text.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DrawerMenuHeader(),
          LeadingIconText(
            icon: Icons.account_circle_rounded, //assignment
            label: 'profile',
            callback: () {
              Navigator.pushNamed(context, TabScreen.route);
            },
          ),
          LeadingIconText(
            // icon: Icons.class_outlined,
            icon: Icons.class_rounded,
            label: 'classes',
            callback: () => Navigator.of(context).pop(),
          ),
          const Divider(),
          LeadingIconText(
            icon: Icons.notifications_rounded,
            label: 'announcement',
            callback: () {},
          ),
          const Divider(),
          LeadingIconText(
            icon: Icons.logout_rounded,
            label: 'logout',
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
