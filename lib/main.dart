import 'package:ekaksha/screens/signin_screen.dart';
import 'package:ekaksha/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ekaksha',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: const WelcomeScreen(),
    );
  }
}
