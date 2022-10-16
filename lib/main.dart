import 'package:flutter/material.dart';
import 'Components/inputBox.dart';

void main() {
  runApp(const MyApp());
}

const Widget hr = SizedBox(
  height: 10,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eKaksha',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
      },
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Welocme to eKaksha'),
        // ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  'Hi, Welcome Back',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster'),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
                radius: 80,
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
                        hr,
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
                              onPressed: () {}, child: Text('Sign Up')),
                          ElevatedButton(
                              onPressed: () {}, child: Text(' Login ')),
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
    );
  }
}
