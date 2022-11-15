import 'package:ekaksha/model/notes_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QuestionerCard extends StatelessWidget {
  final NotesModel notesModel;

  const QuestionerCard(this.notesModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25, // Image radius
          backgroundImage: NetworkImage(notesModel.image),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  notesModel.title,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  DateFormat.yMMMd().format(notesModel.dateTime),
                  style: const TextStyle(color: Colors.black45, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
