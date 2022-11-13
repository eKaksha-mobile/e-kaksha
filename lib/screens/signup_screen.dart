import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekaksha/reusable_widgets/reusable_widget.dart';
import 'package:ekaksha/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String designation = '';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();

  Future<bool> isAdminEmailExists(String requiredEmail) async {
    // final messages = _firestore.collection('messages').get();
    // const snapshot = await firebase.firestore().collection('events').get();
    // return snapshot.docs.map(doc => doc.data());

    // for (var message in messages.d) {}

    // foreach()

    bool result = false;

    final docRef = _firestore.collection("admin");
    await docRef.get().then(
      (res) async {
        for (var message in res.docs) {
          // print(message.data());
          String email =
              await (message.data() as Map<String, dynamic>)['email'];
          // print('email $email, req $requiredEmail');
          if (email == requiredEmail) {
            result = true;
            break;
          }
        }
        // print(data);
        // ...
        // print(email);
      },
      onError: (e) => print("Error getting document: $e"),
    );

    //   _firestore.collection("admin").get().then(
    //     (res) {
    //       for (var message in res.docs) {
    //         print(message.data());
    //       }
    //     },
    //     onError: (e) => print("Error completing: $e"),
    //   );
    // }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
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
            padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/eKaksha_transparent_yellow.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Email", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Confirm Password", Icons.lock_outlined, true,
                    _confirmPasswordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(
                    context, "Sign Up as ${SignUpScreen.designation}",
                    () async {
                  bool result = false;
                  if (SignUpScreen.designation == 'Admin') {
                    result =
                        await isAdminEmailExists(_emailTextController.text);
                  }
                  // String actual_email = 'await getAdminEmail();';

                  // print(actual_email);
                  // print(result);

                  if (!result) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Email Can't be registered as ${SignUpScreen.designation}"),
                      ),
                    );
                    return;
                  }

                  if (_passwordTextController.text ==
                      _confirmPasswordTextController.text) {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "New ${SignUpScreen.designation} account created"),
                        ),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error ${error.toString()}"),
                        ),
                      );
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please use same password"),
                      ),
                    );
                  }
                })
              ],
            ),
          ))),
    );
  }
}
