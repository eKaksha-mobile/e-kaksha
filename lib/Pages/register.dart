import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/inputBox.dart';
import '../Constants.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Now')),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      hr,
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          'eKaksha',
                          style: TextStyle(
                              fontSize: 50.0,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w700,
                              color: Colors.indigo[900],
                              fontFamily: 'Lobster'),
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.bookOpenReader,
                        size: 55.0,
                        color: Colors.indigo[900],
                      ),
                      hr,
                      InputBox(
                        title: 'Full Name',
                        hint: 'eKaksha',
                      ),
                      hr,
                      InputBox(
                        title: 'Email Address',
                        hint: 'eKaksha@gmail.com',
                      ),
                      hr,
                      InputBox(
                        title: 'Mobile Number',
                        hint: '+0 111 222 3333',
                      ),
                      hr,
                      InputBox(
                        title: 'Password',
                        hint: '******',
                      ),
                      hr,
                      InputBox(
                        title: 'Confirm Password',
                        hint: '******',
                      ),
                      hr,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 35),
                        child: Text(
                          'By signing up, you agree to our Terms , Data Policy and Cookies Policy',
                          style: TextStyle(fontSize: 15, color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )),
            // Expanded(
            //   flex: 1,
            //   child: Text(''),
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(35, 0, 35, 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(' Login ')),
                  ElevatedButton(
                      onPressed: () {
                        print('Home');
                      },
                      child: Text('Sign Up')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
