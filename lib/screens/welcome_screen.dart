import 'package:ekaksha/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ekaksha/reusable_widgets/reusable_widget.dart';
import 'package:ekaksha/screens/home_screen.dart';
import 'package:ekaksha/screens/reset_password.dart';
import 'package:ekaksha/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.orange.shade300, Colors.red.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                logoWidget("assets/images/eKaksha_transparent_yellow.png"),
                // const SizedBox(
                //   height: 30,
                // ),
                const SizedBox(
                  height: 60,
                ),
                firebaseUIButton(
                  context,
                  'Student',
                  () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(
                            designation: 'Student',
                          ),
                        ));
                  },
                  backgroundColor: Colors.deepOrangeAccent.shade100,
                ),

                firebaseUIButton(
                  context,
                  'Teacher',
                  () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(
                            designation: 'Teacher',
                          ),
                        ));
                  },
                  backgroundColor: Colors.deepOrangeAccent.shade100,
                ),

                firebaseUIButton(
                  context,
                  'Admin',
                  () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(
                            designation: 'Admin',
                          ),
                        ));
                  },
                  backgroundColor: Colors.deepOrangeAccent.shade100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
