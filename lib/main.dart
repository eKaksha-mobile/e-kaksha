import 'package:ekaksha/dummy_data.dart';
import 'package:ekaksha/home/class/classroom_screen.dart';
import 'package:ekaksha/home/classes_screen.dart';
import 'package:ekaksha/model/student_model.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:get_it/get_it.dart';
import 'home/class/assignment_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home/profile/tab_screen.dart';

GetIt locator = GetIt.instance;

void setupSingletons() async {
  locator.registerLazySingleton<FirebaseService>(() => FirebaseService());
}

void main() async {
  setupSingletons();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static StudentModel studentModel = dummyStudent;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eKaksha',
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: const TextStyle(color: Color.fromRGBO(25, 50, 50, 1)),
              titleLarge: const TextStyle(fontSize: 22, fontFamily: 'Poppins'),
              titleMedium: const TextStyle(fontSize: 18, fontFamily: 'Poppins'),
              titleSmall: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
            ),
      ),
      // theme: ThemeData.dark(),
      // themeMode: ThemeMode.dark,
      // theme: ThemeData(
      //   brightness: Brightness.light,
      // ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   backgroundColor: const Color(0xFF212121),
      //   dividerColor: Colors.black12, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      //   // primarySwatch:
      // ),
      initialRoute: '/',
      routes: {
        // '/': (context) => const TestStorage(),
        // '/': (context) => const WelcomeScreen(),
        '/': (context) => const ClassesScreen(),
        // '/': (context) => const TabScreen(),
        ClassesScreen.route: (context) => const ClassesScreen(),
        TabScreen.route: (context) => const TabScreen(),
        ClassRoomScreen.route: (context) => ClassRoomScreen(),
        AssignmentScreen.route: (context) => const AssignmentScreen(),
      },
      // onGenerateRoute: (settings) {},
      // onUnknownRoute: (settings) {},
    );
  }
}
