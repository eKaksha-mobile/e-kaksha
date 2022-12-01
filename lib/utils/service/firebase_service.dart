import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ekaksha/model/student_model.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/model/assignment_data_model.dart';
import 'package:ekaksha/utils/model/assignment_submitted_data_model.dart';
import 'package:ekaksha/utils/model/student_model.dart';
import 'package:ekaksha/utils/model/subject_model.dart';
import 'package:ekaksha/utils/model/teacher_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

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

  String getCurrentUserEmail() {
    return firebaseAuth.currentUser?.email ?? '';
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
            assetName: SubjectModel.getAssetName(map['subjectId'])));
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
            assetName: SubjectModel.getAssetName(map['subjectId'])));
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

  String extractText(Uint8List documentBytes) {
    String fileText = '';
    try {
      //Load an existing PDF document.
      final PdfDocument document = PdfDocument(
        inputBytes: documentBytes,
      );

      //Extract the text from all the pages.
      String text = PdfTextExtractor(document).extractText();
      //Dispose the document.
      fileText = text;
      document.dispose();
    } catch (e) {
      print(e);
    }
    return fileText;
  }

  Future<PlatformFile> selectFile() async {
    PlatformFile pickedFile = PlatformFile(name: '', size: 0);
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (result != null) {
      pickedFile = result.files.first;
      // filename = pickedFile.name;
    }
    return pickedFile;
  }

  Future uploadFile(PlatformFile pickedFile, String path) async {
    try {
      // final path = 'assignments_pdf/${pickedFile.name}';
      final file = File(pickedFile.path!);

      final ref = database.ref().child(path).putFile(file);

      ref.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            final progress = 100.0 *
                (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            print("Upload is $progress% complete.");
            break;
          case TaskState.paused:
            print("Upload is paused.");
            break;
          case TaskState.canceled:
            print("Upload was canceled");
            break;
          case TaskState.error:
            // Handle unsuccessful uploads
            break;
          case TaskState.success:
            // Handle successful uploads on complete
            // ...
            break;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<Uint8List?> getPdfBytes(String path) async {
    final ref = database.ref().child(path);

    Uint8List? documentBytes;

    await ref.getData(104857600).then((value) {
      documentBytes = value;
    });
    return documentBytes;
  }

  Future<Uint8List?> getPdfBytesFromPlatformFile(
      PlatformFile platformFile) async {
    Uint8List? documentBytes;
    documentBytes = File(platformFile.path!).readAsBytesSync();
    return documentBytes;
  }

  Future<String> getFileUrl(String path) async {
    final refURL = await database.ref().child(path).getDownloadURL();
    return refURL;
  }

  Future<bool> isPathHavingFiles(String path) async {
    bool result = false;
    ListResult ref = await database.ref().child(path).listAll();

    // print(ref.items);

    if (ref.items.isNotEmpty) {
      result = true;
    }
    // print(ref);
    return result;
  }

  Future<List<String>> getFileNamesFromPath(String path) async {
    List<String> names = [];
    ListResult refList = await database.ref().child(path).listAll();
    for (var item in refList.items) {
      names.add(item.name);
    }
    return names;
  }

  Future<List<AssignmentDataModel>> getAssignmentDataModelListBySubjectId(
      String subjectId) async {
    bool result = false;
    late List<Map<String, dynamic>> mapList = [];

    final docRef = firestore.collection("assignments_data");

    await docRef.where('subjectId', isEqualTo: subjectId).get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          // print(res.docs.length);
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

      List<AssignmentDataModel> assignmentDataModels = [];

      for (var map in mapList) {
        assignmentDataModels.add(AssignmentDataModel(
          teacherFirstName: map['teacherFirstName'],
          teacherLastName: map['teacherLastName'],
          teacherEmail: map['teacherEmail'],
          semester: map['sem'],
          assignmentId: map['assignmentId'],
          assignmentName: map['assignmentName'],
          description: map['description'],
          dueDate: map['dueDate'],
          maxMarks: map['maxMarks'],
          subjectId: map['subjectId'],
          subjectName: map['subjectName'],
        ));
      }
      return assignmentDataModels;
    } else {
      return <AssignmentDataModel>[];
    }
  }

  Future<AssignmentDataModel> getAssignmentDataModelByAssignmentId(
      String assignmentId) async {
    bool result = false;
    late List<Map<String, dynamic>> mapList = [];

    final docRef = firestore.collection("assignments_data");

    await docRef.where('assignmentId', isEqualTo: assignmentId).get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          // print(res.docs.length);
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

      List<AssignmentDataModel> assignmentDataModels = [];

      for (var map in mapList) {
        assignmentDataModels.add(AssignmentDataModel(
          teacherFirstName: map['teacherFirstName'],
          teacherLastName: map['teacherLastName'],
          teacherEmail: map['teacherEmail'],
          semester: map['sem'],
          assignmentId: map['assignmentId'],
          assignmentName: map['assignmentName'],
          description: map['description'],
          dueDate: map['dueDate'],
          maxMarks: map['maxMarks'],
          subjectId: map['subjectId'],
          subjectName: map['subjectName'],
        ));
      }
      return assignmentDataModels[0];
    } else {
      return AssignmentDataModel();
    }
  }

  Future saveAssignmentDataModelInFireStore(
      AssignmentDataModel assignmentDataModel) async {
    bool result = false;

    final docRef = firestore.collection("assignments_data");

    Map<String, dynamic> dataMap = assignmentDataModel.getMap();

    docRef.add(dataMap).then((documentSnapshot) =>
        print("Added Data with ID: ${documentSnapshot.id}"));
  }

  Future saveAssignmentSubmittedDataModelInFireStore(
      AssignmentSubmittedDataModel assignmentSubmittedDataModel) async {
    bool result = false;

    final docRef = firestore.collection("assignments_submitted_data");

    Map<String, dynamic> dataMap = assignmentSubmittedDataModel.getMap();

    docRef.add(dataMap).then((documentSnapshot) =>
        print("Added Data with ID: ${documentSnapshot.id}"));
  }

  Future<List<AssignmentSubmittedDataModel>>
      getAssignmentSubmittedDataModelListByAssignmentId(
          String assignmentId) async {
    bool result = false;
    late List<Map<String, dynamic>> mapList = [];

    final docRef = firestore.collection("assignments_submitted_data");

    await docRef.where('assignmentId', isEqualTo: assignmentId).get().then(
      (res) async {
        if (res.docs.isNotEmpty) {
          // print(res.docs.length);
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

      List<AssignmentSubmittedDataModel> assignmentSubmittedDataModels = [];

      for (var map in mapList) {
        assignmentSubmittedDataModels.add(AssignmentSubmittedDataModel(
          assignmentId: map['assignmentId'],
          assignmentName: map['assignmentName'],
          lateSubmission: map['lateSubmission'],
          marks: map['marks'],
          maxMarks: map['maxMarks'],
          plagiarizedAmount: map['plagiarizedAmount'],
          semester: map['sem'],
          studentEmail: map['studentEmail'],
          studentFirstName: map['studentFirstName'],
          studentLastName: map['studentLastName'],
          submittedOn: map['submittedOn'],
          isChecked: map['isChecked'],
        ));
      }
      return assignmentSubmittedDataModels;
    } else {
      return <AssignmentSubmittedDataModel>[];
    }
  }

  Future<AssignmentSubmittedDataModel>
      getAssignmentSubmittedDataModelListByAssignmentIdAndStudentEmail(
          String assignmentId, String email) async {
    bool result = false;
    late List<Map<String, dynamic>> mapList = [];

    final docRef = firestore.collection("assignments_submitted_data");

    await docRef
        .where('assignmentId', isEqualTo: assignmentId)
        .where('studentEmail', isEqualTo: email)
        .get()
        .then(
      (res) async {
        if (res.docs.isNotEmpty) {
          // print(res.docs.length);
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

      List<AssignmentSubmittedDataModel> assignmentSubmittedDataModels = [];

      for (var map in mapList) {
        assignmentSubmittedDataModels.add(AssignmentSubmittedDataModel(
          assignmentId: map['assignmentId'],
          assignmentName: map['assignmentName'],
          lateSubmission: map['lateSubmission'],
          marks: map['marks'],
          maxMarks: map['maxMarks'],
          plagiarizedAmount: map['plagiarizedAmount'],
          semester: map['sem'],
          studentEmail: map['studentEmail'],
          studentFirstName: map['studentFirstName'],
          studentLastName: map['studentLastName'],
          submittedOn: map['submittedOn'],
          isChecked: map['isChecked'],
        ));
      }
      return assignmentSubmittedDataModels[0];
    } else {
      return AssignmentSubmittedDataModel();
    }
  }
}
