import 'package:ekaksha/home/model/ClassModel.dart';
import 'package:flutter/material.dart';

import 'model/assignment_model.dart';
import 'widget/notes_item_card.dart';
import 'widget/student_intro_card.dart';

class ClassRoomScreen extends StatelessWidget {
  static const route = '/classroom_screen';

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
    final ClassModel model = ModalRoute.of(context)?.settings.arguments as ClassModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: Column(
        children: [
          StudentIntroCard(model.title, model.teacherFirstName),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 200 - MediaQuery.of(context).padding.top - kToolbarHeight,
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  NotesItemCard(models.elementAt(index)),
              itemCount: models.length,
            ),
          ),
        ],
      ),
    );
  }
}
