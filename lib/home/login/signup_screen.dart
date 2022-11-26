import 'package:ekaksha/home/classes_screen.dart';
import 'package:ekaksha/home/login/widget/checkbox_text_card.dart';
import 'package:ekaksha/home/login/widget/spannable_text.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../utils/service/session_manager.dart';
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
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  bool isTeacher = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    bool smallScreen = mediaQuery.size.height < 800;
    return Scaffold(
      body: SizedBox(
        height: mediaQuery.size.height,
        child: Stack(
          children: [
            SizedBox(
              height: smallScreen
                  ? mediaQuery.size.height * 0.3
                  : mediaQuery.size.height * 0.4,
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
              top: smallScreen ? 70 : 100,
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
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
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
                    VerticalSpacer(smallScreen ? 15 : 30),
                    InputCard(
                      label: 'Password',
                      hint: 'password',
                      isPassword: true,
                      controller: _passwordTextController,
                    ),
                    VerticalSpacer(smallScreen ? 15 : 20),
                    InputCard(
                      label: 'Confirm Password',
                      hint: 'password',
                      isPassword: true,
                      controller: _confirmPasswordTextController,
                    ),
                    const VerticalSpacer(5),
                    CheckBoxTextCard(
                        label: 'Sign up as teacher',
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
                            GlobalData.isTeacher = true;
                          } else {
                            GlobalData.isTeacher = false;
                          }

                          bool result = false;
                          if (!GlobalData.isTeacher) {
                            result = await GetIt.I
                                .get<FirebaseService>()
                                .isStudentEmailExists(
                                  requiredEmail: _emailTextController.text,
                                );
                          } else if (GlobalData.isTeacher) {
                            result = await GetIt.I
                                .get<FirebaseService>()
                                .isTeacherEmailExists(
                                  requiredEmail: _emailTextController.text,
                                );
                          }

                          if (!result) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Registration failed")));
                            return;
                          }

                          if (_passwordTextController.text ==
                              _confirmPasswordTextController.text) {
                            GetIt.I.get<FirebaseService>().firebaseAuthSignUp(
                                context: context,
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                                message: "User signup successful",
                                onSuccessfulSignUp: () async {
                                  if (!GlobalData.isTeacher) {
                                    // Get Student Model
                                    GlobalData.studentModel = await GetIt.I
                                        .get<FirebaseService>()
                                        .getStudentModel(
                                            _emailTextController.text);

                                    // Get Subject Models List
                                    GlobalData.subjectModels = await GetIt.I
                                        .get<FirebaseService>()
                                        .getSubjectModelListBySem(
                                            GlobalData.studentModel.semester);
                                  } else if (GlobalData.isTeacher) {
                                    // Get Teacher Model
                                    GlobalData.teacherModel = await GetIt.I
                                        .get<FirebaseService>()
                                        .getTeacherModel(
                                            _emailTextController.text);

                                    // Get Subject Models List
                                    GlobalData.subjectModels = await GetIt.I
                                        .get<FirebaseService>()
                                        .getSubjectModelListByEmail(
                                            GlobalData.teacherModel.email);
                                  }
                                  SessionManager.loginRegisterUser();
                                  Navigator.popAndPushNamed(context, ClassesScreen.route);
                                });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please use same password"),
                              ),
                            );
                          }

                          // String actual_email = 'await getAdminEmail();';

                          // print(actual_email);
                          // print(result);
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
