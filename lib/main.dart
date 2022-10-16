import 'package:ekaksha/Pages/main_screen.dart';

import 'Pages/login.dart';
import 'Pages/register.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eKaksha',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.indigo[900],
              foregroundColor: Colors.white),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.indigo[900]),
                fixedSize: MaterialStatePropertyAll(Size(90, 40))),
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context) => MainScreen(),
      },
    );
  }
}
