import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekaksha/home/login/reset_password.dart';
import 'package:ekaksha/home/login/signup_screen.dart';
import 'package:ekaksha/home/login/widget/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../classes_screen.dart';

final _firestore = FirebaseFirestore.instance;

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String designation = '';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();

  TextEditingController _emailTextController = TextEditingController();

  Future<bool> isAdminEmailExists(String requiredEmail) async {
    bool result = false;

    final docRef = _firestore.collection("admin");
    await docRef.where('email', isEqualTo: requiredEmail).get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          result = true;
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return result;
  }

  Future<bool> isStudentEmailExists(String requiredEmail) async {
    bool result = false;

    final docRef = _firestore.collection("students");
    await docRef.where('email', isEqualTo: requiredEmail).get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          result = true;
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return result;
  }

  Future<bool> isTeacherEmailExists(String requiredEmail) async {
    bool result = false;

    final docRef = _firestore.collection("teachers");
    await docRef.where('email', isEqualTo: requiredEmail).get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          result = true;
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return result;
  }

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
                reusableTextField("Enter Email", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(
                    context, "Sign In As ${SignInScreen.designation}",
                    () async {
                  bool result = false;
                  if (SignInScreen.designation == 'Admin') {
                    result =
                        await isAdminEmailExists(_emailTextController.text);
                  } else if (SignInScreen.designation == 'Student') {
                    result =
                        await isStudentEmailExists(_emailTextController.text);
                  } else if (SignInScreen.designation == 'Teacher') {
                    result =
                        await isTeacherEmailExists(_emailTextController.text);
                  }
                  // String actual_email = 'await getAdminEmail();';

                  // print(actual_email);
                  // print(result);

                  if (!result) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Email Can't be signed in as ${SignInScreen.designation}"),
                      ),
                    );
                    return;
                  }

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClassesScreen()));
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Error ${error.toString()}"),
                      ),
                    );
                  });
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have account?",
                        style: TextStyle(color: Colors.white70)),
                    GestureDetector(
                      onTap: () {
                        SignUpScreen.designation = SignInScreen.designation;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text(
                        " Sign Up",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
