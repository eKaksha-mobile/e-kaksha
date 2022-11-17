import 'signin_screen.dart';
import 'widget/reusable_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const route = '/welcome-screen';

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
                    SignInScreen.designation = 'Student';
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ));
                  },
                  backgroundColor: Colors.deepOrangeAccent.shade100,
                ),

                firebaseUIButton(
                  context,
                  'Teacher',
                  () {
                    SignInScreen.designation = 'Teacher';
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ));
                  },
                  backgroundColor: Colors.deepOrangeAccent.shade100,
                ),

                firebaseUIButton(
                  context,
                  'Admin',
                  () {
                    SignInScreen.designation = 'Admin';
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
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
