import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/model/assignment_data_model.dart';
import '../../../utils/service/firebase_service.dart';
import '../../../utils/widget/vertical_spacer.dart';
import '../../widget/input_text.dart';
import '../classroom_screen.dart';

class UploadAssignmentPopUp extends StatefulWidget {
  const UploadAssignmentPopUp({Key? key}) : super(key: key);

  @override
  State<UploadAssignmentPopUp> createState() => _UploadAssignmentPopUpState();
}

class _UploadAssignmentPopUpState extends State<UploadAssignmentPopUp> {
  String fileName = '';
  late PlatformFile pickedFile;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      actionsPadding: const EdgeInsets.only(bottom: 10, right: 15),
      title: const Text(
        "Submit Assignment",
        textAlign: TextAlign.center,
      ),
      scrollable: true,
      content: SizedBox(
        child: Column(
          children: [
            Text(
              fileName == '' ? "*No File Uploaded" : fileName, //apply condition
              style: const TextStyle(fontSize: 12, color: Colors.red),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        ElevatedButton(
            onPressed: () async {
              pickedFile = await GetIt.I.get<FirebaseService>().selectFile();
              setState(() {
                fileName = pickedFile.name;
              });
            },
            child: const Text(
              'Select File',
              textAlign: TextAlign.center,
            )),
        ElevatedButton(
            onPressed: () async {
              // try {
              //   await GetIt.I
              //       .get<FirebaseService>()
              //       .saveAssignmentDataModelInFireStore(tempModel);
              //
              //   if (fileName != '') {
              //     await GetIt.I.get<FirebaseService>().uploadFile(pickedFile,
              //         'assignments_data_pdf/${tempModel.assignmentId}/${pickedFile.name}');
              //   }
              //
              //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              //       content: Text("Assignment Added Successfully")));
              //
              //   Navigator.pop(context, true);
              // } catch (e) {
              //   ScaffoldMessenger.of(context)
              //       .showSnackBar(SnackBar(content: Text(e.toString())));
              // }
            },
            child: const Text(
              'ADD',
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
