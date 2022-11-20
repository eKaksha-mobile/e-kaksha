import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekaksha/home/login/widget/firebaseUIButton.dart';
import 'package:ekaksha/home/login/widget/input_text_field.dart';
import 'package:ekaksha/home/login/widget/logo.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:get_it/get_it.dart';
import '../classes_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// final _firestore = FirebaseFirestore.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();

  Future<bool> isAdminEmailExists(String requiredEmail) async {
    bool result = false;

    final docRef = GetIt.I.get<FirebaseService>().firestore.collection("admin");
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

    final docRef =
        GetIt.I.get<FirebaseService>().firestore.collection("students");
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

    final docRef =
        GetIt.I.get<FirebaseService>().firestore.collection("teachers");
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
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
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
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
                  height: 20,
                ),
                InputTextField(
                    text: "Confirm Password",
                    icon: Icons.lock_outlined,
                    isPasswordType: true,
                    controller: _confirmPasswordTextController),
                const SizedBox(
                  height: 20,
                ),
                LongUIButton(
                    title: "Sign Up as ${GlobalData.designation}",
                    onTap: () async {
                      bool result = false;
                      if (GlobalData.designation == 'Admin') {
                        result =
                            await isAdminEmailExists(_emailTextController.text);
                      } else if (GlobalData.designation == 'Student') {
                        result = await isStudentEmailExists(
                            _emailTextController.text);
                      } else if (GlobalData.designation == 'Teacher') {
                        result = await isTeacherEmailExists(
                            _emailTextController.text);
                      }
                      // String actual_email = 'await getAdminEmail();';

                      // print(actual_email);
                      // print(result);

                      if (!result) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Email Can't be registered as ${GlobalData.designation}"),
                          ),
                        );
                        return;
                      }

                      if (_passwordTextController.text ==
                          _confirmPasswordTextController.text) {
                        GetIt.I
                            .get<FirebaseService>()
                            .firebaseAuth
                            .createUserWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "New ${GlobalData.designation} account created"),
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
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please use same password"),
                          ),
                        );
                      }
                    }),
              ],
            ),
          ))),
    );
  }
}
