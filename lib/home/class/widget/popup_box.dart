import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekaksha/home/class/classroom_screen.dart';
import 'package:ekaksha/home/widget/input_text.dart';
import 'package:ekaksha/utils/model/assignment_data_model.dart';
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

class TeacherPopupBox extends StatefulWidget {
  const TeacherPopupBox({Key? key}) : super(key: key);

  @override
  State<TeacherPopupBox> createState() => _TeacherPopupBoxState();
}

class _TeacherPopupBoxState extends State<TeacherPopupBox> {
  TextEditingController assignmentNameController = TextEditingController();
  TextEditingController assignmentDescriptionController =
      TextEditingController();
  TextEditingController maximumMarksController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

  String fileName = '';
  late PlatformFile pickedFile;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      actionsPadding: const EdgeInsets.only(bottom: 10, right: 15),
      title: const Text(
        "Add New Assignment",
        textAlign: TextAlign.center,
      ),
      scrollable: true,
      content: SizedBox(
        child: Column(
          children: [
            InputText(
              label: 'Assignment Name',
              hint: 'Title',
              controller: assignmentNameController,
            ),
            InputText(
              label: 'Description',
              hint: "Brief Description",
              controller: assignmentDescriptionController,
              isMultiLineKeyboard: true,
            ),
            InputText(
              label: 'Maximum Marks',
              hint: "Max Marks",
              controller: maximumMarksController,
            ),
            InputText(
              label: 'Due Date',
              hint: 'YYYY/MM/dd',
              controller: dueDateController,
              isDateTimeField: true,
            ),
            VerticalSpacer(5),
            Text(
              fileName == '' ? "*No File Uploaded" : fileName, //apply condition
              style: TextStyle(fontSize: 12, color: Colors.red),
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
              try {
                if (assignmentNameController.text == '' ||
                    assignmentDescriptionController.text == '' ||
                    maximumMarksController.text == '' ||
                    dueDateController.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please Fill all the Fields")));
                } else {
                  AssignmentDataModel tempModel = AssignmentDataModel(
                    assignmentId: const Uuid().v4(),
                    assignmentName: assignmentNameController.text,
                    description: assignmentDescriptionController.text,
                    maxMarks: int.parse(maximumMarksController.text),
                    dueDate: Timestamp.fromDate(
                        DateTime.parse(dueDateController.text)),
                    semester: ClassRoomScreen.currentSubjectModel.semester,
                    subjectName: ClassRoomScreen.currentSubjectModel.title,
                    subjectId: ClassRoomScreen.currentSubjectModel.id,
                    teacherEmail:
                        ClassRoomScreen.currentSubjectModel.teacherEmail,
                    teacherFirstName:
                        ClassRoomScreen.currentSubjectModel.teacherFirstName,
                    teacherLastName:
                        ClassRoomScreen.currentSubjectModel.teacherLastName,
                  );

                  await GetIt.I
                      .get<FirebaseService>()
                      .saveAssignmentDataModelInFireStore(tempModel);

                  if (fileName != '') {
                    await GetIt.I.get<FirebaseService>().uploadFile(pickedFile,
                        'assignments_data_pdf/${tempModel.assignmentId}/${pickedFile.name}');
                  }

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Assignment Added Successfully")));

                  Navigator.pop(context, true);
                }
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
            child: const Text(
              'ADD',
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}

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
