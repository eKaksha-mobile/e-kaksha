import 'package:ekaksha/home/profile/screen/announcement_screen.dart';
import 'package:ekaksha/test/test_screen.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/screens/pdf_viewer.dart';
import 'package:ekaksha/utils/service/plagiarism.dart';
import 'package:ekaksha/utils/service/session_manager.dart';

import 'package:flutter/material.dart';

import 'package:ekaksha/home/class/classroom_screen.dart';
import 'package:ekaksha/home/classes_screen.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home/class/scoring_screen.dart';
import 'home/login/signup_screen.dart';
import 'home/profile/tab_screen.dart';
import 'home/login/login_screen.dart';
import 'package:get_it/get_it.dart';
import 'home/class/assignment_screen.dart';

GetIt locator = GetIt.instance;

void setupSingletons() async {
  locator.registerLazySingleton<FirebaseService>(() => FirebaseService());
}

Future<void> main() async {
  setupSingletons();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (await SessionManager.isActive()) {
    await SessionManager.getActiveUser();
    debugPrint('session ${GlobalData.sessionActive}');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Plagiarism plagiarism = Plagiarism();

  @override
  Widget build(BuildContext context) {
    // () async {
    //   await plagiarism.getData();
    // }();
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
      initialRoute: '/',
      routes: {
        '/': (context) => const TestScreen(),
        // '/': (context) => GlobalData.sessionActive
        //     ? const ClassesScreen()
        //     : const LoginScreen(),
        TabScreen.route: (context) => const TabScreen(),
        LoginScreen.route: (context) => const LoginScreen(),
        SignUpScreen.route: (context) => const SignUpScreen(),
        ClassesScreen.route: (context) => const ClassesScreen(),
        ClassRoomScreen.route: (context) => const ClassRoomScreen(),
        AssignmentScreen.route: (context) => const AssignmentScreen(),
        ScoringScreen.route: (context) => const ScoringScreen(),
        PdfViewer.route: (context) => const PdfViewer(),
        AnnouncementScreen.route: ((context) => AnnouncementScreen()),
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/') {}
      //   return null;
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      },
    );
  }
}
