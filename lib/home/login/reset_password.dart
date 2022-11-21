import 'package:ekaksha/home/login/login_screen.dart';
import 'package:ekaksha/home/login/signup_screen.dart';
import 'package:ekaksha/home/login/widget/card_button.dart';
import 'package:ekaksha/home/login/widget/checkbox_text_card.dart';
import 'package:ekaksha/home/login/widget/firebaseUIButton.dart';
import 'package:ekaksha/home/login/widget/input_card.dart';
import 'package:ekaksha/home/login/widget/input_text_field.dart';
import 'package:ekaksha/home/login/widget/logo.dart';
import 'package:ekaksha/home/login/widget/spannable_text.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:ekaksha/utils/widget/vertical_spacer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ResetPassword extends StatefulWidget {
  static const route = '/reset-password';
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SizedBox(
        height: mediaQuery.size.height * 50,
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
              top: 50,
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
                height: mediaQuery.size.height * 0.7,
                width: mediaQuery.size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const VerticalSpacer(10),
                    const Text(
                      'Reset Password',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const VerticalSpacer(10),
                    InputCard(
                      label: 'Email',
                      hint: 'email id',
                      isPassword: false,
                      controller: _emailTextController,
                    ),
                    const VerticalSpacer(30),
                    CardButton(
                        title: 'Reset',
                        callback: () async {
                          GetIt.I
                              .get<FirebaseService>()
                              .firebaseAuthResetPassword(
                                context: context,
                                email: _emailTextController.text,
                                onSuccessfulResetPassword: () =>
                                    Navigator.of(context).pop(),
                              );
                        }),
                    const VerticalSpacer(40),
                    SpannableText(
                      label: 'Don\'t want to reset password?',
                      action: '',
                      callback: () {},
                    ),
                    const VerticalSpacer(10),
                    SpannableText(
                      label: "Back to SignIn? ",
                      action: 'Sign In',
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
