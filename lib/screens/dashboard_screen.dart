import 'package:ekaksha/reusable_widgets/constant.dart';
import 'package:ekaksha/reusable_widgets/top_intro_banner.dart';
import 'package:ekaksha/reusable_widgets/two_row_set.dart';
import 'package:ekaksha/screens/announcement_screen.dart';
import 'package:ekaksha/screens/home_screen.dart';
import 'package:ekaksha/screens/profile_screen.dart';
import 'package:ekaksha/screens/progress_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _auth = FirebaseAuth.instance;
late User loggedInUser;
// late var currentUserData;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
    currentUser();
  }

  void currentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser);
      }
    } catch (e) {
      // print('e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300,
        elevation: 2,
        title: const Text(
          "eKaksha Dashboard",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout_rounded),
              onPressed: () {
                // messageStream();
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: gradientdecoration_YR,
        child: Center(
          child: Column(
            children: [
              TopIntroCard(
                text1: 'Welcome ,',
                text2: (loggedInUser.email).toString(),
              ),
              Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 2, 0, 3),
                          child: IndividualRowSet(
                            t1: 'Announcement',
                            t1Icon: Icons.campaign,
                            t1OnTap: () {
                              // HomeScreen.loggedInUser = loggedInUser;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AnnouncementScreen()));
                            },
                            t2: 'Classroom',
                            t2Icon: Icons.school,
                            t2OnTap: () {
                              HomeScreen.loggedInUser = loggedInUser;
                              HomeScreen.data = data;
                              HomeScreen.semSubject = semSubject;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                              //used HomeScreen as ClassroomScreen
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 2, 0, 5),
                            child: IndividualRowSet(
                              t1: 'Profile',
                              t2: 'Progress Report',
                              t1Icon: Icons.person,
                              t2Icon: Icons.auto_graph,
                              t1OnTap: () {
                                // print(loggedInUser);
                                ProfileScreen.loggedInUser = loggedInUser;
                                ProfileScreen.data = data;
                                ProfileScreen.semSubject = semSubject;

                                Navigator.pushNamed(
                                    context, ProfileScreen.route);
                              },
                              t2OnTap: () {
                                HomeScreen.loggedInUser = loggedInUser;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProgressScreen()));
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    _auth.signOut();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    // margin: const EdgeInsets.only(top: 5.0),
                    decoration: gradientdecoration_PP,
                    child: const Text(
                      'Logout',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
