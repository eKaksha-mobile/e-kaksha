import 'package:firebase_auth/firebase_auth.dart';
import 'package:ekaksha/reusable_widgets/reusable_widget.dart';
import 'package:ekaksha/screens/home_screen.dart';
import 'package:ekaksha/screens/reset_password.dart';
import 'package:ekaksha/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({required this.designation});
  final String designation;

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
            padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/eKaksha_transparent_yellow.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Email ", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                firebaseUIButton(context, "Sign In As $designation", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Signed In Successfully"),
                      ),
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Error ${error.toString()}"),
                      ),
                    );
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
