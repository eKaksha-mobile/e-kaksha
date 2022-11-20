import 'package:ekaksha/home/login/widget/firebaseUIButton.dart';
import 'package:ekaksha/home/login/widget/input_text_field.dart';
import 'package:ekaksha/home/login/widget/logo.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Reset Password",
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
                LongUIButton(
                    title: "Reset Password",
                    onTap: () {
                      GetIt.I.get<FirebaseService>().firebaseAuthResetPassword(
                            context: context,
                            email: _emailTextController.text,
                            onSuccessfulResetPassword: () =>
                                Navigator.of(context).pop(),
                          );
                    })
              ],
            ),
          ))),
    );
  }
}
