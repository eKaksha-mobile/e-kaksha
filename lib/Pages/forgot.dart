import 'package:flutter/material.dart';
import '../Components/inputBox.dart';
import '../Constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Forgot extends StatelessWidget {
  const Forgot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forget Pasword ?')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.bookOpenReader,
              size: 65.0,
              color: Colors.indigo[900],
            ),
            hr,
            hr,
            Text(
              'Reset Your Password',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10),
              child: Text(
                'In order to reset your password, Enter your Registered Email Address Or Phone Number',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            InputBox(
              title: 'Registered Email Address',
              hint: 'ekaksha@gmail.com',
            ),
            hr,
            Text('OR'),
            hr,
            InputBox(
              title: 'Registered Mobile Number',
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Login'),
              style: ButtonStyle(
                fixedSize: MaterialStatePropertyAll(
                    Size(MediaQuery.of(context).size.width - 70, 50)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
