import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ekaksha/model/student_model.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/model/student_model.dart';
import 'package:ekaksha/utils/model/subject_model.dart';
import 'package:ekaksha/utils/model/teacher_model.dart';
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

  Future<StudentModel> getStudentModel(String requiredEmail) async {
    bool result = false;
    late Map<String, dynamic> map;

    final docRef = firestore.collection("students");

    await docRef.where('email', isEqualTo: requiredEmail).get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          result = true;
          map = res.docs.first.data();
          // print(map);
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    if (result) {
      // print("dob :");
      // print(map['dob']);
      return StudentModel(
        rollNo: map['rollNo'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        email: map['email'],
        mobile: map['phoneNo'],
        semester: map['sem'],
        gender: map['gender'],
        dob: map['dob'],
        totalScore: map['totalScore'],
        pendingAssignments: map['pending'],
      );
    } else {
      return StudentModel();
    }
  }

  Future<TeacherModel> getTeacherModel(String requiredEmail) async {
    bool result = false;
    late Map<String, dynamic> map;

    final docRef = firestore.collection("teachers");

    await docRef.where('email', isEqualTo: requiredEmail).get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          result = true;
          map = res.docs.first.data();
          // print(map);
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    if (result) {
      // print("dob :");
      // print(map['dob']);
      return TeacherModel(
        firstName: map['firstName'],
        lastName: map['lastName'],
        email: map['email'],
        mobile: map['phoneNo'],
        gender: map['gender'],
        dob: map['dob'],
      );
    } else {
      return TeacherModel();
    }
  }

  Future<List<SubjectModel>> getSubjectModelListBySem(int semester) async {
    bool result = false;
    late List<Map<String, dynamic>> mapList = [];

    final docRef = firestore.collection("subjects");

    await docRef.where('sem', isEqualTo: semester).get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          result = true;
          for (var doc in res.docs) {
            mapList.add(doc.data());
          }
          // map = res.docs.first.data();
          // print(map);
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    if (result) {
      // print("dob :");
      // print(map['dob']);

      List<SubjectModel> subjectModels = [];

      for (var map in mapList) {
        subjectModels.add(SubjectModel(
            id: map['subjectId'],
            title: map['name'],
            semester: map['sem'],
            teacherEmail: map['teacherEmail'],
            teacherFirstName: map['firstName'],
            teacherLastName: map['lastName'],
            assetName: 'assets/images/1.png'));
      }
      return subjectModels;
    } else {
      return <SubjectModel>[];
    }
  }

  Future<List<SubjectModel>> getSubjectModelListByEmail(
      String teacherEmail) async {
    bool result = false;
    late List<Map<String, dynamic>> mapList = [];

    final docRef = firestore.collection("subjects");

    await docRef.where('teacherEmail', isEqualTo: teacherEmail).get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          result = true;
          for (var doc in res.docs) {
            mapList.add(doc.data());
          }
          // map = res.docs.first.data();
          // print(map);
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    if (result) {
      // print("dob :");
      // print(map['dob']);

      List<SubjectModel> subjectModels = [];

      for (var map in mapList) {
        subjectModels.add(SubjectModel(
            id: map['subjectId'],
            title: map['name'],
            semester: map['sem'],
            teacherEmail: map['teacherEmail'],
            teacherFirstName: map['firstName'],
            teacherLastName: map['lastName'],
            assetName: 'assets/images/1.png'));
      }
      return subjectModels;
    } else {
      return <SubjectModel>[];
    }
  }

  Future<List<StudentModel>> getAllStudentModelList() async {
    bool result = false;
    late List<Map<String, dynamic>> mapList = [];

    final docRef = firestore.collection("students");

    await docRef.get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          result = true;
          for (var doc in res.docs) {
            mapList.add(doc.data());
          }
          // map = res.docs.first.data();
          // print(map);
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    if (result) {
      // print("dob :");
      // print(map['dob']);

      List<StudentModel> studentModels = [];

      for (var map in mapList) {
        studentModels.add(StudentModel(
          rollNo: map['rollNo'],
          firstName: map['firstName'],
          lastName: map['lastName'],
          email: map['email'],
          mobile: map['phoneNo'],
          semester: map['sem'],
          gender: map['gender'],
          dob: map['dob'],
          totalScore: map['totalScore'],
          pendingAssignments: map['pending'],
        ));
      }
      return studentModels;
    } else {
      return <StudentModel>[];
    }
  }
}
