import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  late final FirebaseAuth firebaseAuth;
  late final FirebaseFirestore firestore;
  late final FirebaseStorage database;

  FirebaseService() {
    firebaseAuth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
    database = FirebaseStorage.instance;
  }

  Future<bool> isAdminEmailExists({required String requiredEmail}) async {
    bool result = false;

    final docRef = firestore.collection("admin");
    await docRef.where('email', isEqualTo: requiredEmail).get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          result = true;
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return result;
  }

  Future<bool> isStudentEmailExists({required String requiredEmail}) async {
    bool result = false;

    final docRef = firestore.collection("students");
    await docRef.where('email', isEqualTo: requiredEmail).get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          result = true;
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return result;
  }

  Future<bool> isTeacherEmailExists({required String requiredEmail}) async {
    bool result = false;

    final docRef = firestore.collection("teachers");
    await docRef.where('email', isEqualTo: requiredEmail).get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          result = true;
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return result;
  }

  void firebaseAuthSignIn({
    required BuildContext context,
    required String email,
    required String password,
    required String message,
    required void Function() onSuccessfulSignIn,
  }) {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      onSuccessfulSignIn();
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error ${error.toString()}"),
        ),
      );
    });
  }

  void firebaseAuthSignUp({
    required BuildContext context,
    required String email,
    required String password,
    required String message,
    required void Function() onSuccessfulSignUp,
  }) {
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      onSuccessfulSignUp();
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error ${error.toString()}"),
      ));
    });
  }

  void firebaseAuthResetPassword({
    required BuildContext context,
    required String email,
    required void Function() onSuccessfulResetPassword,
  }) {
    firebaseAuth
        .sendPasswordResetEmail(email: email)
        .then((value) => onSuccessfulResetPassword())
        .onError((error, stackTrace) {
      // print("Error ${error.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error ${error.toString()}"),
        ),
      );
    });
  }
}
