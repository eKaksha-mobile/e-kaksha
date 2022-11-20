import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekaksha/home/login/reset_password.dart';
import 'package:ekaksha/home/login/signup_screen.dart';
import 'package:ekaksha/home/login/widget/firebaseUIButton.dart';
import 'package:ekaksha/home/login/widget/input_text_field.dart';
import 'package:ekaksha/home/login/widget/logo.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../classes_screen.dart';

// final _firestore = FirebaseFirestore.instance;

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
              children: <Widget>[
                const Logo(
                    imageName: "assets/images/eKaksha_transparent_yellow.png"),
                const SizedBox(
                  height: 30,
                ),
                InputTextField(
                    text: "Enter Email",
                    icon: Icons.person_outline,
                    isPasswordType: false,
                    controller: _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                InputTextField(
                    text: "Enter Password",
                    icon: Icons.lock_outline,
                    isPasswordType: true,
                    controller: _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                LongUIButton(
                    title: "Sign In As ${GlobalData.designation}",
                    onTap: () async {
                      bool result = false;
                      if (GlobalData.designation == 'Admin') {
                        result = await GetIt.I
                            .get<FirebaseService>()
                            .isAdminEmailExists(
                              requiredEmail: _emailTextController.text,
                            );
                      } else if (GlobalData.designation == 'Student') {
                        result = await GetIt.I
                            .get<FirebaseService>()
                            .isStudentEmailExists(
                              requiredEmail: _emailTextController.text,
                            );
                      } else if (GlobalData.designation == 'Teacher') {
                        result = await GetIt.I
                            .get<FirebaseService>()
                            .isTeacherEmailExists(
                              requiredEmail: _emailTextController.text,
                            );
                      }
                      // String actual_email = 'await getAdminEmail();';

                      // print(actual_email);
                      // print(result);

                      if (!result) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Email Can't be signed in as ${GlobalData.designation}"),
                          ),
                        );
                        return;
                      }

                      GetIt.I.get<FirebaseService>().firebaseAuthSignIn(
                            context: context,
                            email: _emailTextController.text,
                            password: _passwordTextController.text,
                            message: "Signed In Successfully",
                            onSuccessfulSignIn: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ClassesScreen())),
                          );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have account?",
                        style: TextStyle(color: Colors.white70)),
                    GestureDetector(
                      onTap: () {
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
