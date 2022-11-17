import 'package:flutter/material.dart';

import 'model/assignment_model.dart';
import 'widget/examiner_card.dart';

class AssignmentScreen extends StatelessWidget {
  static const route = '/assignment_screen';

  const AssignmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notesModel = ModalRoute.of(context)?.settings.arguments as AssignmentModel;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ExaminerCard(notesModel),
          const SizedBox(
            height: 10,
          ),
          Text(
            notesModel.question,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 30,
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
