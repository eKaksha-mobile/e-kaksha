// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:ekaksha/screens/classroom_screen.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';
//
// final _auth = FirebaseAuth.instance;
// late User loggedInUser;
// late Map currentloginUser;
// List classRoomList = [];
// List classImage = [
//   // "https://images.unsplash.com/photo-1554755229-ca4470e07232?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fHRleHR1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
//   "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OXxpMVBIV0dNay11RXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
//   "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dGVjaG5vbG9neSUyMGJhY2tncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
//   "https://images.unsplash.com/photo-1620570623737-efc0ec4ab486?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHRlY2hub2xvZ3klMjBiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
//   "https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fHRlY2hub2xvZ3klMjBiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
//   "https://images.unsplash.com/photo-1555099962-4199c345e5dd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fGNvZGluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
//   "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHRlY2hub2xvZ3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
//   "https://images.unsplash.com/photo-1568952433726-3896e3881c65?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHRlY2hub2xvZ3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
//   "https://images.unsplash.com/photo-1597733336794-12d05021d510?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTN8fHRlY2hub2xvZ3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
//   "https://images.unsplash.com/photo-1558494949-ef010cbdcc31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8bmV0d29ya2luZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
//   "https://images.unsplash.com/photo-1571786256017-aee7a0c009b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c2VydmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
// ];
//
// List data = [
//   {
//     'name': 's1',
//     'email': 's1@gmail.com',
//     'semester': 7,
//     'position': 'student',
//     'subject': ['math', 'phy', 'chm']
//   },
//   {
//     'name': 's2',
//     'email': 'abc@gmail.com',
//     'semester': 7,
//     'position': 'student',
//     'subject': ['math', 'phy', 'chm']
//   },
//   {
//     'name': 's3',
//     'email': 's3@gmail.com',
//     'semester': 6,
//     'position': 'student',
//     'subject': ['math', 'phy', 'chm']
//   },
//   {
//     'name': 't1',
//     'email': 't1@gmail.com',
//     'semester': 6,
//     'position': 'teacher',
//     'subject': ['math']
//   },
// ];
//
// Map semSubject = {
//   '7': ['Data Mining', 'Deep Learning', 'Block Chain', 'Road Safety'],
//   '6': [
//     'Machine Learning',
//     'Artificial Intelligence',
//     'Cloud Computing',
//     'Compiler Design'
//   ]
// };
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     currentUser();
//   }
//
//   void currentUser() async {
//     try {
//       final user = _auth.currentUser;
//       if (user != null) {
//         loggedInUser = user;
//         print(loggedInUser.email);
//       }
//     } catch (e) {
//       // print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     void classRoom(int n) {
//       // print(semSubject['$n']);
//       for (var classes in semSubject['$n']) {
//         classRoomList.add(GestureDetector(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => ClassRoomScreen()));
//             // print('/${classes.toLowerCase()}');
//           },
//           child: Container(
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Color(0xFFB38179),
//               image: DecorationImage(
//                   image: NetworkImage(classImage[Random().nextInt(7)]
//                       // "https://source.unsplash.com/random/?texture"
//                       ),
//                   fit: BoxFit.cover),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.blueGrey,
//                   blurRadius: 1.0,
//                   spreadRadius: 0.0,
//                   offset: Offset(1.0, 1.0), // shadow direction: bottom right
//                 )
//               ],
//             ),
//             padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
//             margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//             child: Text(
//               classes,
//               style: const TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//           ),
//         ));
//       }
//     }
//
//     for (var people in data) {
//       // print('hello ${people["email"]}');
//       if (people['email'] == loggedInUser.email) {
//         currentloginUser = people;
//         classRoom(people['semester']);
//         print(currentloginUser);
//         break;
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Hi,',
//               style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold),
//             ),
//             Text((currentloginUser['name'].toUpperCase()).toString(),
//                 style: const TextStyle(
//                     fontSize: 15,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold))
//           ],
//         ),
//         actions: <Widget>[
//           IconButton(
//               icon: const Icon(
//                 Icons.close,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 _auth.signOut();
//                 Navigator.pop(context);
//               }),
//         ],
//       ),
//       body: Center(
//         child: ListView(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ...classRoomList,
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:math';

import 'package:ekaksha/screens/classroom_screen.dart';
import 'package:ekaksha/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ekaksha/screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final _auth = FirebaseAuth.instance;
late User loggedInUser;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [
    {
      'name': 'ekaksha',
      'email': 'ekaksha.official.app@gmail.com',
      'semester': 7,
      // 'position': 'student',
      // 'subject': ['math', 'phy', 'chm']
    },
    {
      'name': 's2',
      'email': 'abc@gmail.com',
      'semester': 7,
      'position': 'student',
      'subject': ['math', 'phy', 'chm']
    },
    {
      'name': 's3',
      'email': 's3@gmail.com',
      'semester': 6,
      'position': 'student',
      'subject': ['math', 'phy', 'chm']
    },
    {
      'name': 't1',
      'email': 't1@gmail.com',
      'semester': 6,
      'position': 'teacher',
      'subject': ['math']
    },
  ];

  Map semSubject = {
    '7': [
      'Data Mining',
      'Deep Learning',
      'Block Chain',
      'Road Safety',
      'Network Security'
    ],
    '6': [
      'Machine Learning',
      'Artificial Intelligence',
      'Cloud Computing',
      'Compiler Design'
    ]
  };

  @override
  void initState() {
    super.initState();
    currentUser();
    for (var std in data) {
      // print('hello ${std["email"]}');
      if (std['email'] == loggedInUser.email) {
        classRoom(std['semester']);
        break;
      }
    }
  }

  void currentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      // print('e');
    }
  }

  List classRoomSection = [];

  void classRoom(int n) {
    for (var classes in semSubject['$n']) {
      // if (classRoomSection.length < semSubject['$n'].length) {
      classRoomSection.add(GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            image: DecorationImage(
                // image: AssetImage(
                //     'assets/images/banner${Random().nextInt(12) + 1}.jpg'),
                image: AssetImage('assets/images/banner12.jpg'),
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey,
                blurRadius: 1.0,
                spreadRadius: 0.0,
                offset: Offset(1.0, 1.0), // shadow direction: bottom right
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                classes,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Semester $n',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ));
      // }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300,
        elevation: 0,
        title: const Text(
          "eKaksha Classroom",
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
        child: Center(
          child: ListView(
            children: [...classRoomSection],
          ),
        ),
      ),
    );
  }
}
