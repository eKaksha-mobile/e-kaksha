import 'package:ekaksha/home/login/reset_password.dart';
import 'package:ekaksha/home/login/widget/card_button.dart';
import 'package:ekaksha/home/login/widget/input_card.dart';
import 'package:flutter/material.dart';

import '../../utils/widget/vertical_spacer.dart';
import 'widget/checkbox_text_card.dart';
import 'widget/spannable_text.dart';
import 'tsignup_screen.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SizedBox(
        height: mediaQuery.size.height,
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
              top: 100,
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
                height: mediaQuery.size.height * 0.65,
                width: mediaQuery.size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
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
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const VerticalSpacer(30),
                    const InputCard(
                      label: 'Email',
                      hint: 'email id',
                      isPassword: false,
                    ),
                    const VerticalSpacer(20),
                    const InputCard(
                      label: 'Password',
                      hint: 'password',
                      isPassword: true,
                    ),
                    const VerticalSpacer(5),
                    const CheckBoxTextCard(),
                    const VerticalSpacer(40),
                    CardButton(title: 'Login', callback: () {}),
                    const VerticalSpacer(30),
                    SpannableText(
                      label: '',
                      action: 'Forgot password?',
                      callback: () => Navigator.of(context).pushNamed(ResetPassword.route),
                    ),
                    const VerticalSpacer(10),
                    SpannableText(
                      label: "Don't have any account? ",
                      action: 'Sign up',
                      callback: () => Navigator.of(context).pushReplacementNamed(SignUpScreen.route),
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
