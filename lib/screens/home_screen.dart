import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static User? loggedInUser;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [
    {
      'name': 'ekaksha',
      'email': 'ekaksha.official.app@gmail.com',
      'semester': 6,
      // 'position': 'student',
      // 'subject': ['math', 'phy', 'chm']
    },
    {
      'name': 's2',
      'email': 's1@gmail.com',
      'semester': 7,
      'position': 'student',
      'subject': ['math', 'phy', 'chm']
    },
    {
      'name': 's3',
      'email': 's3@gmail.com',
      'semester': 6,
      'position': 'student',
      'subject': ['math', 'phy', 'chm']
    },
    {
      'name': 't1',
      'email': 't1@gmail.com',
      'semester': 6,
      'position': 'teacher',
      'subject': ['math']
    },
  ];

  Map semSubject = {
    '7': [
      'Data Mining',
      'Deep Learning',
      'Block Chain',
      'Road Safety',
      'Network Security'
    ],
    '6': [
      'Machine Learning',
      'Artificial Intelligence',
      'Cloud Computing',
      'Compiler Design'
    ]
  };

  @override
  void initState() {
    super.initState();
    for (var std in data) {
      // print(HomeScreen.loggedInUser?.email);
      if (std['email'] == HomeScreen.loggedInUser?.email) {
        classRoom(std['semester']);
        break;
      }
    }
  }

  List classRoomSection = [];

  void classRoom(int n) {
    for (var classes in semSubject['$n']) {
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
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300,
        elevation: 2,
        title: const Text(
          "eKaksha Classroom",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade300, Colors.red.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: ListView(
            children: [...classRoomSection],
          ),
        ),
      ),
    );
  }
}
