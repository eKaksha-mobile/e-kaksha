import 'package:ekaksha/home/class/widget/notes_item_card.dart';
import 'package:ekaksha/home/class/widget/popup_box.dart';
import 'package:ekaksha/home/class/widget/upload_assignment.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/model/assignment_model.dart';
import 'package:ekaksha/utils/model/assignment_submitted_data_model.dart';
import 'package:ekaksha/utils/value/colors.dart';
import 'package:ekaksha/utils/widget/leading_icon_text.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../utils/model/assignment_data_model.dart';
import '../../utils/screens/pdf_viewer.dart';
import '../../utils/service/firebase_service.dart';
import 'widget/examiner_card.dart';

// class AssignmentScreen1 extends StatelessWidget {
//   static const route = '/assignment_screen';
//   static AssignmentDataModel currentAssignmentDataModel = AssignmentDataModel();
//
//   const AssignmentScreen1({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     var data =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
//     AssignmentDataModel notesModel = data['notesModel'];
//     List<String> attachmentsList = data['attachmentsList'];
//     List studentSubmittedList = [
//       'Student 1',
//       'Student 2',
//       'Student 3',
//       'Student 4',
//       'Student 5',
//       'Student 6',
//       'Student 7',
//       'Student 8'
//     ];
//
//     return Scaffold(
//       appBar: AppBar(),
//       floatingActionButton: !GlobalData.isTeacher
//           ? FloatingActionButton(
//               backgroundColor: oceanBlue,
//               onPressed: (() {
//                 showDialog(
//                     context: context,
//                     builder: (context) => const UploadAssignmentPopUp());
//               }),
//               child: const Icon(
//                 Icons.add,
//               ),
//             )
//           : null,
//       body: ListView(
//         children: [
//           Card(
//             elevation: 0.5,
//             child: Container(
//                 // decoration: BoxDecoration(
//                 //     border: Border.all(width: 2, color: Colors.grey)),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                 margin: const EdgeInsets.all(2),
//                 child: Column(
//                   children: [
//                     ExaminerCard(notesModel),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 5),
//                       child: Text(
//                         notesModel.description,
//                         textAlign: TextAlign.justify,
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'Poppins',
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) => LeadingIconText(
//                           iconSize: 18.0,
//                           labelSize: 14.0,
//                           iconSpacing: 4.0,
//                           verticalMargin: 0.5,
//                           horizontalMargin: 0.0,
//                           labelHeight: 1.0,
//                           iconColor: Colors.red,
//                           labelColor: Colors.red,
//                           icon: Icons.attach_file,
//                           label: attachmentsList[index],
//                           callback: () async {
//                             var documentBytes = await GetIt.I
//                                 .get<FirebaseService>()
//                                 .getPdfBytes(
//                                     'assignments_data_pdf/${notesModel.assignmentId}/${attachmentsList[index]}');
//                             () {
//                               Navigator.of(context)
//                                   .pushNamed(PdfViewer.route, arguments: {
//                                 'documentBytes': documentBytes,
//                                 'title': attachmentsList[index],
//                               });
//                             }();
//                           }),
//                       itemCount: attachmentsList.length,
//                     ),
//                   ],
//                 )),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.70,
//             margin: const EdgeInsets.only(top: 5),
//             child: ListView.builder(
//               itemBuilder: (context, index) => submittedStudent(
//                 studentSubmittedList.elementAt(index), //Sharing Student details
//                 index: index + 1,
//               ),
//               itemCount: studentSubmittedList.length,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({Key? key}) : super(key: key);

  static const route = '/assignment_screen';
  static AssignmentDataModel currentAssignmentDataModel = AssignmentDataModel();

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  List<AssignmentSubmittedDataModel> assignmentSubmittedDataModelList = [];
  bool isAssignmentUploaded = false;

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    AssignmentDataModel notesModel = data['notesModel'];
    List<String> attachmentsList = data['attachmentsList'];
    // List studentSubmittedList = [
    //   'Student 1',
    //   'Student 2',
    //   'Student 3',
    //   'Student 4',
    //   'Student 5',
    //   'Student 6',
    //   'Student 7',
    //   'Student 8'
    // ];

    () async {
      if (GlobalData.isTeacher) {
        assignmentSubmittedDataModelList = await GetIt.I
            .get<FirebaseService>()
            .getAssignmentSubmittedDataModelListByAssignmentId(
                notesModel.assignmentId);
      } else {
        assignmentSubmittedDataModelList = [
          await GetIt.I
              .get<FirebaseService>()
              .getAssignmentSubmittedDataModelListByAssignmentIdAndStudentEmail(
                  notesModel.assignmentId, GlobalData.studentModel.email)
        ];

        isAssignmentUploaded = await GetIt.I
            .get<FirebaseService>()
            .isStudentUploadedAssignment(
                notesModel.assignmentId, GlobalData.studentModel.email);
      }

      setState(() {});
    }();

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: !GlobalData.isTeacher && !isAssignmentUploaded
          ? FloatingActionButton(
              backgroundColor: oceanBlue,
              onPressed: (() {
                showDialog(
                    context: context,
                    builder: (context) => const UploadAssignmentPopUp());
              }),
              child: const Icon(
                Icons.add,
              ),
            )
          : null,
      body: ListView(
        children: [
          Card(
            elevation: 0.5,
            child: Container(
                // decoration: BoxDecoration(
                //     border: Border.all(width: 2, color: Colors.grey)),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                margin: const EdgeInsets.all(2),
                child: Column(
                  children: [
                    ExaminerCard(notesModel),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        notesModel.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => LeadingIconText(
                          iconSize: 18.0,
                          labelSize: 14.0,
                          iconSpacing: 4.0,
                          verticalMargin: 0.5,
                          horizontalMargin: 0.0,
                          labelHeight: 1.0,
                          iconColor: Colors.red,
                          labelColor: Colors.red,
                          icon: Icons.attach_file,
                          label: attachmentsList[index],
                          callback: () async {
                            var documentBytes = await GetIt.I
                                .get<FirebaseService>()
                                .getPdfBytes(
                                    'assignments_data_pdf/${notesModel.assignmentId}/${attachmentsList[index]}');
                            () {
                              Navigator.of(context)
                                  .pushNamed(PdfViewer.route, arguments: {
                                'documentBytes': documentBytes,
                                'title': attachmentsList[index],
                              });
                            }();
                          }),
                      itemCount: attachmentsList.length,
                    ),
                  ],
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            margin: const EdgeInsets.only(top: 5),
            child: ListView.builder(
              itemBuilder: (context, index) => submittedStudent(
                assignmentSubmittedDataModelList
                        .elementAt(index)
                        .studentFirstName +
                    " " +
                    assignmentSubmittedDataModelList
                        .elementAt(index)
                        .studentLastName, //Sharing Student details
                index: index + 1,
                marks: assignmentSubmittedDataModelList.elementAt(index).marks,
                maxMarks:
                    assignmentSubmittedDataModelList.elementAt(index).maxMarks,
                isChecked:
                    assignmentSubmittedDataModelList.elementAt(index).isChecked,
              ),
              itemCount: assignmentSubmittedDataModelList.length,
            ),
          )
        ],
      ),
    );
  }
}

class submittedStudent extends StatelessWidget {
  final int index;
  String data;
  int marks;
  int maxMarks;
  bool isChecked;

  submittedStudent(
    this.data, {
    required this.index,
    required this.marks,
    required this.maxMarks,
    required this.isChecked,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/3011/3011270.png'),
                      radius: 22.5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data}".toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins'),
                            ),
                            const SizedBox(
                              height: 1.5,
                            ),
                            Text(
                              "Score : ${marks} / ${maxMarks}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey[200]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(
                isChecked ? Icons.check_circle_outline : Icons.highlight_off,
                size: 30,
                color: isChecked ? Colors.green : Colors.red,
              )
            ],
          )),
    );
  }
}
