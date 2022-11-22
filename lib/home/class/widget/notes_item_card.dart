import 'package:ekaksha/utils/model/assignment_data_model.dart';
import 'package:ekaksha/utils/model/assignment_model.dart';
import 'package:flutter/material.dart';

// import '../../../model/assignment_model.dart';
import '../assignment_screen.dart';
import '../../../utils/widget/leading_icon_text.dart';
import 'examiner_card.dart';

class NotesItemCard extends StatelessWidget {
  final AssignmentDataModel notesModel;

  const NotesItemCard(this.notesModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AssignmentScreen.route, arguments: notesModel);
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
                notesModel.description,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.black),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // LeadingIconText(
              //   icon: Icons.attach_file,
              //   label: '${notesModel.tAttachments} attachments',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
