import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const route = '/assignment_screen';

  const ProfileScreen({super.key});
  static User? loggedInUser;
  static List? data;
  static Map? semSubject;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var currentUserData;
  @override
  void initState() {
    super.initState();
    for (var std in ProfileScreen.data!) {
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
    for (var subject in ProfileScreen.semSubject!['$n']) {
      semCard.add(
        CardWidget(
          heading: subject,
          icon: Icons.label_important,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const CircleAvatar(
                radius: 76.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 73.0,
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
            SizedBox(
              height: 25.0,
              width: 100.0,
              child: Divider(
                color: Colors.teal[100],
              ),
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

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.heading, required this.icon})
      : super(key: key);
  final IconData icon;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black87,
        ),
        title: Text(
          heading,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
