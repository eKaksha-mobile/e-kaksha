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
              onPressed: (() {}),
              child: const Icon(
                Icons.add,
              ),
            )
          : null,
      body: Column(
        children: [
          ExaminerCard(notesModel),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration:
                BoxDecoration(border: Border.all(width: 2, color: Colors.grey)),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            margin: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
          ),
        ],
      ),
    );
  }
}
