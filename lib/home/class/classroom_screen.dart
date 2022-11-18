import 'package:flutter/material.dart';

import 'model/assignment_model.dart';
import 'widget/notes_item.dart';
import 'widget/student_intro_card.dart';

class ClassRoomScreen extends StatelessWidget {
  ClassRoomScreen({Key? key}) : super(key: key);

  final List<AssignmentModel> models = [
    AssignmentModel('_title', DateTime.now(), '_question', 3,
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
    AssignmentModel('_title', DateTime.now(), '_question', 3,
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
    AssignmentModel('_title', DateTime.now(), '_question', 3,
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
    AssignmentModel('_title', DateTime.now(), '_question', 3,
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
    AssignmentModel('_title', DateTime.now(), '_question', 3,
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
    AssignmentModel('_title', DateTime.now(), '_question', 3,
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
    AssignmentModel('_title', DateTime.now(), '_question', 3,
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
    AssignmentModel('_title', DateTime.now(), '_question', 3,
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classroom'),
      ),
      body: Column(
        children: [
          const StudentIntroCard(text1: 'text1', text2: 'text2'),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 200 - MediaQuery.of(context).padding.top - kToolbarHeight,
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  NotesItem(models.elementAt(index)),
              itemCount: models.length,
            ),
          ),
        ],
      ),
    );
  }
}