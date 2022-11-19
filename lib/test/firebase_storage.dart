import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekaksha/home/login/reset_password.dart';
import 'package:ekaksha/home/login/signup_screen.dart';
import 'package:ekaksha/home/login/widget/firebaseUIButton.dart';
import 'package:ekaksha/home/login/widget/input_text_field.dart';
import 'package:ekaksha/home/login/widget/logo.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final _firestore = FirebaseFirestore.instance;

class TestStorage extends StatefulWidget {
  static const route = '/test_storage';
  const TestStorage({Key? key}) : super(key: key);
  static String designation = '';

  @override
  State<TestStorage> createState() => _TestStorage();
}

class _TestStorage extends State<TestStorage> {
  late PlatformFile pickedFile;
  Future selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      pickedFile = result.files.first;
      filename = pickedFile.name;
    } else {
      // User canceled the picker
      return;
    }
  }

  Future uploadFile() async {
    try {
      final path = 'assignments_pdf/${pickedFile.name}';
      final file = File(pickedFile.path!);

      final ref = GetIt.I
          .get<FirebaseService>()
          .database
          .ref()
          .child(path)
          .putFile(file);

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

  // final FirebaseService _firebaseService = GetIt.I.get<FirebaseService>() as FirebaseService;

  // final storageRef = _firebaseService.database.ref();

//   final mountainsRef = GetIt.I.get<FirebaseService>().database.ref().child("mountains.jpg");
//
// // Create a reference to 'images/mountains.jpg'
//   final mountainImagesRef = storageRef.child("images/mountains.jpg");
//
// // While the file names are the same, the references point to different files
//   assert(mountainsRef.name == mountainImagesRef.name);
//   assert(mountainsRef.fullPath != mountainImagesRef.fullPath);

  String filename = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.orange.shade300, Colors.red.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
            child: Column(
              children: <Widget>[
                const Logo(
                    imageName: "assets/images/eKaksha_transparent_yellow.png"),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(filename == '' ? 'No File Uploaded' : filename,
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                // forgetPassword(context),
                firebaseUIButton(
                    title: "Select File",
                    onTap: () async {
                      await selectFile();
                      setState(() {});
                    }),
                firebaseUIButton(
                    title: "Upload File", onTap: () => uploadFile()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// void uploadFile() async{
//   final appDocDir = await getApplicationDocumentsDirectory();
//   final filePath = "${appDocDir.absolute}/path/to/mountains.jpg";
//   final file = File(filePath);
//
// // Create the file metadata
//   final metadata = SettableMetadata(contentType: "image/jpeg");
//
// // Create a reference to the Firebase Storage bucket
//   final storageRef = FirebaseStorage.instance.ref();
//
// // Upload file and metadata to the path 'images/mountains.jpg'
//   final uploadTask = storageRef
//       .child("images/path/to/mountains.jpg")
//       .putFile(file, metadata);
//
// // Listen for state changes, errors, and completion of the upload.
//   uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
//     switch (taskSnapshot.state) {
//       case TaskState.running:
//         final progress =
//             100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
//         print("Upload is $progress% complete.");
//         break;
//       case TaskState.paused:
//         print("Upload is paused.");
//         break;
//       case TaskState.canceled:
//         print("Upload was canceled");
//         break;
//       case TaskState.error:
//       // Handle unsuccessful uploads
//         break;
//       case TaskState.success:
//       // Handle successful uploads on complete
//       // ...
//         break;
//     }
//   });
// }
