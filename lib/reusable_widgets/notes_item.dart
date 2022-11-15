import 'package:ekaksha/screens/assignment_screen.dart';
import 'package:flutter/material.dart';
import '../model/notes_model.dart';
import 'leading_icon_text.dart';
import 'questioner_card.dart';

class NotesItem extends StatelessWidget {
  final NotesModel notesModel;

  const NotesItem(this.notesModel, {Key? key}) : super(key: key);

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
              QuestionerCard(notesModel),
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
