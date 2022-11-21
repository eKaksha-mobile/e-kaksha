import 'package:ekaksha/home/classes_screen.dart';
import 'package:ekaksha/home/login/widget/card_button.dart';
import 'package:ekaksha/home/login/widget/input_card.dart';
import 'package:ekaksha/home/login/widget/reset_password_dialog.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../utils/widget/vertical_spacer.dart';
import 'widget/checkbox_text_card.dart';
import 'widget/spannable_text.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _resetEmailTextController =
      TextEditingController();
  bool isTeacher = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    // print(mediaQuery.size.height);
    bool smallScreen = mediaQuery.size.height < 800;
    return Scaffold(
      body: SizedBox(
        height:
            smallScreen ? mediaQuery.size.height * 50 : mediaQuery.size.height,
        child: Stack(
          children: [
            SizedBox(
              height: mediaQuery.size.height * 0.5,
              child: const Image(
                image: AssetImage('assets/images/banner0.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: smallScreen ? 50 : 100,
              child: Container(
                width: mediaQuery.size.width,
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                    height: 160,
                    width: 160,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: smallScreen
                    ? mediaQuery.size.height * 0.7
                    : mediaQuery.size.height * 0.65,
                width: mediaQuery.size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const VerticalSpacer(10),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    VerticalSpacer(smallScreen ? 10 : 30),
                    InputCard(
                      label: 'Email',
                      hint: 'email id',
                      isPassword: false,
                      controller: _emailTextController,
                    ),
                    VerticalSpacer(smallScreen ? 5 : 20),
                    InputCard(
                      label: 'Password',
                      hint: 'password',
                      isPassword: true,
                      controller: _passwordTextController,
                    ),
                    const VerticalSpacer(5),
                    CheckBoxTextCard(
                      callback: (value) {
                        setState(() {
                          isTeacher = value;
                        });
                      },
                      label: 'I will be signing as teacher?',
                    ),
                    VerticalSpacer(smallScreen ? 30 : 40),
                    CardButton(
                        title: 'Login',
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
                                onSuccessfulSignIn: () async {
                                  if (GlobalData.designation == 'Student') {
                                    GlobalData.studentModel = await GetIt.I
                                        .get<FirebaseService>()
                                        .getStudentModel(
                                            _emailTextController.text);
                                  }
                                  debugPrint('${GlobalData.studentModel}');

                                  Navigator.of(context).pushReplacementNamed(
                                      ClassesScreen.route);
                                },
                              );
                        }),
                    VerticalSpacer(smallScreen ? 40 : 30),
                    SpannableText(
                        label: '',
                        action: 'Forgot password?',
                        callback: () => showDialog(
                              context: context,
                              builder: (context) => ResetPasswordDialog(
                                  textController: _resetEmailTextController,
                                  positiveCallback: () {
                                    GetIt.I
                                        .get<FirebaseService>()
                                        .firebaseAuthResetPassword(
                                          context: context,
                                          email: _resetEmailTextController.text,
                                          onSuccessfulResetPassword: () =>
                                              Navigator.of(context).pop(),
                                        );
                                  },
                                  negativeCallback: () =>
                                      Navigator.pop(context)),
                            )
                        // Navigator.of(context).pushNamed(ResetPassword.route),
                        ),
                    const VerticalSpacer(10),
                    SpannableText(
                      label: "Don't have any account? ",
                      action: 'Sign up',
                      callback: () =>
                          Navigator.of(context).pushNamed(SignUpScreen.route),
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
