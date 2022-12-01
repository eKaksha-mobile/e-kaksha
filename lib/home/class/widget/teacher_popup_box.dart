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