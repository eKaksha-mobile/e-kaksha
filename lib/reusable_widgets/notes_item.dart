import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/notes_model.dart';

class NotesItem extends StatelessWidget {
  final NotesModel notesModel;

  const NotesItem(this.notesModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CircleAvatar(
            radius: 48, // Image radius
            backgroundImage: NetworkImage(notesModel.image),
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(notesModel.title),
                  Text(DateFormat.yMMMd().format(notesModel.dateTime)),
                ],
              ),
            ],
          ),
          Text(notesModel.title),
          RichText(
            text: TextSpan(
              children: [
                const WidgetSpan(child: Icon(Icons.attach_file)),
                TextSpan(text: ' ${notesModel.tAttachments} attachment'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
