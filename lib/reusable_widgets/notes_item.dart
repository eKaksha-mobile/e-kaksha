import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/notes_model.dart';

class NotesItem extends StatelessWidget {
  final NotesModel notesModel;

  const NotesItem(this.notesModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
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
                          style: const TextStyle(
                              color: Colors.black45, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
              height: 10,
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  const WidgetSpan(
                      child: Icon(
                    Icons.attach_file,
                    size: 16,
                  )),
                  TextSpan(text: ' ${notesModel.tAttachments} attachment'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
