import 'package:ekaksha/screens/announcement_screen.dart';
import 'package:ekaksha/screens/home_screen.dart';
import 'package:ekaksha/screens/profile_screen.dart';
import 'package:ekaksha/screens/progress_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _auth = FirebaseAuth.instance;
late User loggedInUser;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
    const TextStyle sm = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    BoxDecoration gradientdecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.orange.shade300, Colors.red.shade300],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );

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
        decoration: gradientdecoration,
        child: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        height: 180,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          image: const DecorationImage(
                              image: AssetImage('assets/images/banner1.jpg'),
                              fit: BoxFit.cover),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black87,
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                              offset: Offset(
                                  1.0, 1.0), // shadow direction: bottom right
                            )
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome ,',
                              style: sm,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                (loggedInUser.email).toString(),
                                style: sm,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                          AnnouncementScreen()));
                            },
                            t2: 'Classroom',
                            t2Icon: Icons.campaign,
                            t2OnTap: () {
                              HomeScreen.loggedInUser = loggedInUser;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                              //used HomeScreen as ClassroomScreen
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 2, 0, 5),
                            child: IndividualRowSet(
                              t1: 'Profile',
                              t2: 'Progress Visualization',
                              t1Icon: Icons.person,
                              t2Icon: Icons.auto_graph,
                              t1OnTap: () {
                                // print(loggedInUser);
                                HomeScreen.loggedInUser = loggedInUser;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileScreen()));
                              },
                              t2OnTap: () {
                                HomeScreen.loggedInUser = loggedInUser;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProgressScreen()));
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
                    // height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      'Logout',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    margin: const EdgeInsets.all(5.0),
                    decoration: gradientdecoration,
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

class IndividualRowSet extends StatelessWidget {
  const IndividualRowSet(
      {Key? key,
      required this.t1,
      required this.t2,
      required this.t1OnTap,
      required this.t2OnTap,
      this.t1Icon = Icons.priority_high,
      this.t2Icon = Icons.priority_high})
      : super(key: key);

  final String t1;
  final IconData t1Icon;
  final VoidCallback t1OnTap;
  final IconData t2Icon;
  final String t2;
  final VoidCallback t2OnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: GestureDetector(
          onTap: t1OnTap,
          child: ContainerBox(
            colour: Colors.orange,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  t1Icon,
                  size: 35,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  t1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )),
        Expanded(
            child: GestureDetector(
          onTap: t2OnTap,
          child: ContainerBox(
            colour: Colors.orange,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  t2Icon,
                  size: 35,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  t2,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}

class ContainerBox extends StatelessWidget {
  ContainerBox({required this.colour, this.cardChild});

  final Color colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: cardChild,
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: colour,
          image: const DecorationImage(
              image: AssetImage('assets/images/plainbanner.jpg'),
              fit: BoxFit.cover),
          boxShadow: const [
            BoxShadow(
              color: Colors.black87,
              blurRadius: 3.0,
              spreadRadius: 1.0,
              offset: Offset(1.5, 1.5), // shadow direction: bottom right
            )
          ],
          borderRadius: BorderRadius.circular(15.0)),
    );
  }
}
