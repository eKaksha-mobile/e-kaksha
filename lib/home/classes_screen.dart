import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ekaksha/dummy_data.dart';

import '../menu/drawer_menu.dart';

class ClassesScreen extends StatefulWidget {
  static const route = '/classes_screen';

  const ClassesScreen({Key? key}) : super(key: key);
  static User? loggedInUser = FirebaseAuth.instance.currentUser;
  static List data = dummyData;
  static Map semSubject = dummySemSubject;

  @override
  _ClassesScreenState createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  @override
  void initState() {
    super.initState();
    for (var std in ClassesScreen.data) {
      // print(HomeScreen.loggedInUser?.email);
      if (std['email'] == ClassesScreen.loggedInUser?.email) {
        classRoom(std['semester']);
        break;
      }
    }
  }

  List classRoomSection = [];

  void classRoom(int n) {
    for (var classes in ClassesScreen.semSubject['$n']) {
      // if (classRoomSection.length < semSubject['$n'].length) {
      classRoomSection.add(GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/banner${Random().nextInt(12) + 1}.jpg'),
                // image: AssetImage('assets/images/banner12.jpg'),
                fit: BoxFit.cover),
            boxShadow: const [
              BoxShadow(
                color: Colors.black87,
                blurRadius: 2.0,
                spreadRadius: 1.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
              )
            ],
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: 150,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Semester $n',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Text(
                classes,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ));
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text(
          "eKaksha Classroom",
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: ListView(
            children: [...classRoomSection],
          ),
        ),
      ),
    );
  }
}
