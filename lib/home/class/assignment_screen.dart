import 'package:ekaksha/home/class/widget/popup_box.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/model/assignment_model.dart';
import 'package:ekaksha/utils/value/colors.dart';
import 'package:ekaksha/utils/widget/leading_icon_text.dart';
import 'package:flutter/material.dart';

import '../../utils/model/assignment_data_model.dart';
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

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: !GlobalData.isTeacher
          ? FloatingActionButton(
              backgroundColor: oceanBlue,
              onPressed: (() {
                showDialog(
                    context: context,
                    builder: (context) => PopupBox(
                          title: "Upload Assignment",
                          labelInput1: "Doc Link",
                          labelInput2: "",
                          hintInput1: 'Assignment Link',
                          hintInput2: '',
                        ));
              }),
              child: const Icon(
                Icons.add,
              ),
            )
          : null,
      body: Column(
        children: [
          Card(
            elevation: 1,
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
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        notesModel.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                      ),
                      itemCount: attachmentsList.length,
                    ),
                  ],
                )),
          ),

          // const SizedBox(
          //   height: 15,
          // ),
          // const Text(
          //   'Attachments',
          //   textAlign: TextAlign.start,
          //   style: TextStyle(color: Colors.black),
          // ),
        ],
      ),
    );
  }
}
