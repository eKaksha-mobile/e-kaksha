import 'package:ekaksha/home/classes_screen.dart';
import 'package:ekaksha/home/login/login_screen.dart';
import 'package:ekaksha/home/login/widget/checkbox_text_card.dart';
import 'package:ekaksha/home/login/widget/spannable_text.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../utils/widget/vertical_spacer.dart';
import 'widget/card_button.dart';
import 'widget/input_card.dart';

class SignUpScreen extends StatefulWidget {
  static const route = '/signup_screen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  bool isTeacher = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      body: SizedBox(
        height: mediaQuery.size.height,
        child: Stack(
          children: [
            SizedBox(
              height: mediaQuery.size.height * 0.3,
              width: double.infinity,
              child: const Image(
                image: AssetImage('assets/images/banner0.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            // Container(
            //   height: mediaQuery.padding.top,
            //   color: theme.primaryColor,
            // ),
            Positioned(
              top: 70,
              child: SizedBox(
                width: mediaQuery.size.width,
                child: const Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: mediaQuery.size.height * 0.75,
                width: mediaQuery.size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InputCard(
                      label: 'Email',
                      hint: 'email',
                      isPassword: false,
                      controller: _emailTextController,
                    ),
                    const VerticalSpacer(15),
                    InputCard(
                      label: 'Password',
                      hint: 'password',
                      isPassword: true,
                      controller: _passwordTextController,
                    ),
                    const VerticalSpacer(15),
                    InputCard(
                      label: 'Confirm Password',
                      hint: 'password',
                      isPassword: true,
                      controller: _confirmPasswordTextController,
                    ),
                    const VerticalSpacer(5),
                    CheckBoxTextCard(
                        label: 'I will be signing as teacher?',
                        callback: (value) {
                          setState(() {
                            isTeacher = value;
                          });
                        }),
                    const VerticalSpacer(50),
                    CardButton(
                        title: 'Sign Up',
                        callback: () async {
                          if (isTeacher) {
                            GlobalData.designation = 'Teacher';
                          } else {
                            GlobalData.designation = 'Student';
                          }

                          bool result = false;
                          if (GlobalData.designation == 'Student') {
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
                                    "Email Can't be registered as ${GlobalData.designation}"),
                              ),
                            );
                            return;
                          }

                          if (_passwordTextController.text ==
                              _confirmPasswordTextController.text) {
                            GetIt.I.get<FirebaseService>().firebaseAuthSignUp(
                                  context: context,
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text,
                                  message:
                                      "New ${GlobalData.designation} account created",
                                  onSuccessfulSignUp: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ClassesScreen())),
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please use same password"),
                              ),
                            );
                          }
                        }),
                    const VerticalSpacer(20),
                    SpannableText(
                      label: "Already have any account? ",
                      action: 'Login',
                      callback: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
