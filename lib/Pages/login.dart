import 'package:flutter/material.dart';
import '../Components/inputBox.dart';
import '../Constants.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hi, Welcome Back',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lobster',
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    hr,
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                      radius: MediaQuery.of(context).size.height / 100 * 12,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          InputBox(
                            title: 'Mobile Number',
                            hint: '+0 111 222 4444',
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 15.0),
                              child: Text('OR')),
                          InputBox(
                            title: 'Registered Email Address',
                            hint: 'ekaksha@gmail.com',
                          ),
                          hr,
                          InputBox(
                            title: 'Password',
                            hint: '******',
                          ),
                          hr,
                          GestureDetector(
                              onTap: () {
                                print('tap');
                              },
                              child: Text(
                                'Forget Password ?',
                              )),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 100, 35, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: Text('Sign Up')),
                            ElevatedButton(
                                onPressed: () {
                                  print('object');
                                },
                                child: Text(' Login ')),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
