import 'package:ekaksha/home/class/widget/notes_item_card.dart';
import 'package:ekaksha/home/class/widget/popup_box.dart';
import 'package:ekaksha/home/class/widget/submitted_student.dart';
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

class AssignmentScreen extends StatelessWidget {
  static const route = '/assignment_screen';

  const AssignmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    AssignmentDataModel notesModel = data['notesModel'];
    List<String> attachmentsList = data['attachmentsList'];
    List studentSubmittedList = [
      'Student 1',
      'Student 2',
      'Student 3',
      'Student 4',
      'Student 5',
      'Student 6',
      'Student 7',
      'Student 8'
    ];

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: !GlobalData.isTeacher
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
            height: MediaQuery.of(context).size.height * 0.65,
            margin: const EdgeInsets.only(top: 5),
            child: ListView.builder(
              itemBuilder: (context, index) => SubmittedStudent(
                studentSubmittedList.elementAt(index), //Sharing Student details
                index: index + 1,
              ),
              itemCount: studentSubmittedList.length,
            ),
          )
        ],
      ),
    );
  }
}
