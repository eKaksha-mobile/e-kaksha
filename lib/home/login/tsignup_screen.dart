import 'package:ekaksha/home/login/login_screen.dart';
import 'package:ekaksha/home/login/widget/spannable_text.dart';
import 'package:flutter/material.dart';

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
              height: mediaQuery.size.height * 0.4,
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
              top: 100,
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
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const InputCard(
                      label: 'Email',
                      hint: 'sidharth@gmail.com',
                      isPassword: false,
                    ),
                    const VerticalSpacer(30),
                    const InputCard(
                      label: 'Password',
                      hint: 'password',
                      isPassword: true,
                    ),
                    const VerticalSpacer(20),
                    const InputCard(
                      label: 'Confirm Password',
                      hint: 'password',
                      isPassword: true,
                    ),
                    const VerticalSpacer(50),
                    CardButton(title: 'Sign Up', callback: () {}),
                    const VerticalSpacer(20),
                    SpannableText(
                      label: "Already have any account? ",
                      action: 'Login',
                      callback: () => Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.route),
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
