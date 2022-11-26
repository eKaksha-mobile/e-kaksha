// import 'package:ekaksha/model/assignment_model.dart';
import 'package:ekaksha/utils/model/assignment_data_model.dart';
import 'package:ekaksha/utils/model/assignment_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExaminerCard extends StatelessWidget {
  final AssignmentDataModel notesModel;

  const ExaminerCard(this.notesModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25, // Image radius
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
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
                  notesModel.assignmentName,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  DateFormat.yMMMd().format(notesModel.dueDate.toDate()),
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
