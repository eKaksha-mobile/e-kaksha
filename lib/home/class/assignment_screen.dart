import 'package:ekaksha/home/class/widget/popup_box.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/model/assignment_model.dart';
import 'package:ekaksha/utils/value/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/model/assignment_data_model.dart';
import 'widget/examiner_card.dart';

class AssignmentScreen extends StatelessWidget {
  static const route = '/assignment_screen';

  const AssignmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notesModel =
        ModalRoute.of(context)?.settings.arguments as AssignmentDataModel;

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
            elevation: 5,
            child: Container(
                // decoration: BoxDecoration(
                //     border: Border.all(width: 2, color: Colors.grey)),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                margin: const EdgeInsets.all(2),
                child: ExaminerCard(notesModel)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            notesModel.description,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.black),
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
