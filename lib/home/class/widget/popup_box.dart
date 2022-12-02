import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekaksha/home/class/assignment_screen.dart';
import 'package:ekaksha/home/class/classroom_screen.dart';
import 'package:ekaksha/home/widget/input_text.dart';
import 'package:ekaksha/utils/model/assignment_data_model.dart';
import 'package:ekaksha/utils/screens/pdf_viewer.dart';
import 'package:ekaksha/utils/widget/vertical_spacer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/service/firebase_service.dart';

// class TeacherPopupBox1 extends StatelessWidget {
//   TeacherPopupBox1({super.key});
//
//   TextEditingController assignmentNameController = TextEditingController();
//   TextEditingController assignmentDescriptionController =
//       TextEditingController();
//   TextEditingController maximumMarksController = TextEditingController();
//   TextEditingController durDateController = TextEditingController();
//
//   String fileName = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//       actionsPadding: const EdgeInsets.only(bottom: 10, right: 15),
//       title: const Text(
//         "Add New Assignment",
//         textAlign: TextAlign.center,
//       ),
//       scrollable: true,
//       content: SizedBox(
//         child: Column(
//           children: [
//             InputText(
//               label: 'Assignment Name',
//               hint: 'Title',
//               controller: assignmentNameController,
//             ),
//             InputText(
//               label: 'Description',
//               hint: "Brief Description",
//               controller: assignmentDescriptionController,
//               isMultiLineKeyboard: true,
//             ),
//             InputText(
//               label: 'Maximum Marks',
//               hint: "Max Marks",
//               controller: maximumMarksController,
//             ),
//             InputText(
//               label: 'Due Date',
//               hint: 'DD/MM/YYYY',
//               controller: durDateController,
//               isDateTimeField: true,
//             ),
//             VerticalSpacer(5),
//             Text(
//               fileName == '' ? "*No File Uploaded" : fileName, //apply condition
//               style: TextStyle(fontSize: 12, color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.white,
//       actions: [
//         ElevatedButton(
//             onPressed: () async {
//               PlatformFile file =
//                   await GetIt.I.get<FirebaseService>().selectFile();
//               fileName = file.name;
//               // st
//             },
//             child: const Text(
//               'Select File',
//               textAlign: TextAlign.center,
//             )),
//         ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context, true);
//             },
//             child: const Text(
//               'ADD',
//               textAlign: TextAlign.center,
//             )),
//       ],
//     );
//   }
// }
//
// SizedBox(
// height: MediaQuery.of(context).size.height * 0.3,

class PopupBox extends StatelessWidget {
  PopupBox(
      {super.key,
      required this.title,
      required this.labelInput1,
      required this.labelInput2,
      this.hintInput1 = '',
      this.hintInput2 = ''});
  final String title;
  final String labelInput1;
  final String labelInput2;
  late String hintInput1;
  late String hintInput2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actionsPadding: const EdgeInsets.only(bottom: 10, right: 15),
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      scrollable: false,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          children: [
            InputText(
              label: labelInput1,
              hint: hintInput1,
              controller: TextEditingController(),
            ),
            labelInput2.isNotEmpty
                ? InputText(
                    label: labelInput2,
                    hint: hintInput2,
                    controller: TextEditingController(),
                  )
                : Container(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text('ADD'),
        ),
      ],
    );
  }
}
//
// SizedBox(
// height: MediaQuery.of(context).size.height * 0.3,
