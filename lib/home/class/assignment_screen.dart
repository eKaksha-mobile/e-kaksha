import 'package:ekaksha/home/widget/popup_box.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/model/assignment_model.dart';
import 'package:ekaksha/utils/value/colors.dart';
import 'package:flutter/material.dart';

import 'widget/examiner_card.dart';

class AssignmentScreen extends StatelessWidget {
  static const route = '/assignment_screen';

  const AssignmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notesModel =
        ModalRoute.of(context)?.settings.arguments as AssignmentModel;

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: GlobalData.designation == 'Student'
          ? FloatingActionButton(
              backgroundColor: oceanBlue,
              onPressed: (() {
                showDialog(
                    context: context,
                    builder: (context) => const PopupBox(
                          labelInput1: "Title",
                          labelInput2: "Doc Link",
                          hintInput1: 'Assignment Name',
                          hintInput2: 'Assignment Link',
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
            notesModel.question,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Attachments',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
