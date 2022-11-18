import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:ekaksha/dummy_data.dart';
import 'widget/card_widget.dart';

class ProfileScreen extends StatefulWidget {
  static const route = '/profile_screen';

  const ProfileScreen({super.key});
  static User? loggedInUser = FirebaseAuth.instance.currentUser;
  static List data = dummyData;
  static Map semSubject = dummySemSubject;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var currentUserData;
  @override
  void initState() {
    super.initState();
    for (var std in ProfileScreen.data) {
      // print(HomeScreen.loggedInUser?.email);
      if (std['email'] == ProfileScreen.loggedInUser?.email) {
        currentUserData = std;
        semCardWidget(std['semester']);
        break;
      }
    }
    print(currentUserData);
  }

  List semCard = [];
  void semCardWidget(int n) {
    for (var subject in ProfileScreen.semSubject['$n']) {
      semCard.add(
        CardWidget(
          heading: subject,
          icon: Icons.label_important,
        ),
      );
    }
  }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF121927),

      appBar: AppBar(
        title: const Text(
          'Student Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        // backgroundColor: Color(0xFF0D1520),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const CircleAvatar(
                radius: 66.0,
                // backgroundColor: Colors.blueGrey,
                child: CircleAvatar(
                  radius: 63.0,
                  backgroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/4139/4139981.png'),
                ),
              ),
            ),
            Text(
              currentUserData['name'],
              style: const TextStyle(
                fontSize: 35.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              "STUDENT",
              style: TextStyle(
                letterSpacing: 0.5,
                fontSize: 20.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15.0,
              width: 100.0,
              // child: Divider(
              //   color: Colors.teal.shade900,
              // ),
            ),
            CardWidget(
              heading: (currentUserData['email']).toString(),
              icon: Icons.email,
            ),
            CardWidget(
              heading: "Semester ${currentUserData['semester']}",
              icon: Icons.class_,
            ),
            const CardWidget(
              heading: "Current Subjects",
              icon: Icons.verified,
            ),
            ...semCard,
          ],
        ),
      ),
    );
  }
}
