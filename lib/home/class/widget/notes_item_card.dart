import 'package:flutter/material.dart';

import '../model/assignment_model.dart';
import '../assignment_screen.dart';
import '../../../utils/widget/leading_icon_text.dart';
import 'examiner_card.dart';

class NotesItemCard extends StatelessWidget {
  final AssignmentModel notesModel;

  const NotesItemCard(this.notesModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AssignmentScreen.route, arguments: notesModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                height: 10,
              ),
              LeadingIconText(Icons.attach_file, '${notesModel.tAttachments} attachments'),
            ],
          ),
        ),
      ),
    );
  }
}
