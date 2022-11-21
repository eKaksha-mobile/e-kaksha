import 'package:ekaksha/dummy_data.dart';
import 'package:ekaksha/utils/data/global_data.dart';
// import 'package:ekaksha/model/ClassModel.dart';
// import 'package:ekaksha/utils/model/ClassModel.dart';
import 'package:ekaksha/utils/model/assignment_model.dart';
import 'package:ekaksha/utils/value/colors.dart';
import 'package:ekaksha/utils/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'widget/notes_item_card.dart';
import 'widget/student_intro_card.dart';

class ClassRoomScreen extends StatelessWidget {
  static const route = '/classroom_screen';

  ClassRoomScreen({Key? key}) : super(key: key);

  final List<AssignmentModel> models = dummyAssignments;

  @override
  Widget build(BuildContext context) {
    final SubjectModel model =
        ModalRoute.of(context)?.settings.arguments as SubjectModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      floatingActionButton: GlobalData.designation == 'Teacher'
          ? FloatingActionButton(
              backgroundColor: oceanBlue,
              onPressed: (() {}),
              child: const Icon(
                Icons.add,
              ),
            )
          : null,
      body: Column(
        children: [
          StudentIntroCard(model.title, model.teacherFirstName),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height -
                200 -
                MediaQuery.of(context).padding.top -
                kToolbarHeight,
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
