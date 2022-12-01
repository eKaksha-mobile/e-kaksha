import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekaksha/dummy_data.dart';
import 'package:ekaksha/home/class/widget/intro_card.dart';
import 'package:ekaksha/home/class/widget/popup_box.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/model/assignment_data_model.dart';
// import 'package:ekaksha/model/ClassModel.dart';
// import 'package:ekaksha/utils/model/ClassModel.dart';
import 'package:ekaksha/utils/model/assignment_model.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:ekaksha/utils/value/colors.dart';
import 'package:ekaksha/utils/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'widget/notes_item_card.dart';
// import 'widget/student_intro_card.dart';

// class ClassRoomScreen1 extends StatelessWidget {
//   static const route = '/classroom_screen';
//   final TextEditingController _resetEmailTextController =
//       TextEditingController();
//
//   ClassRoomScreen1({Key? key}) : super(key: key);
//
//   final List<AssignmentModel> assignmentsData = dummyAssignments;
//
//   @override
//   Widget build(BuildContext context) {
//     final SubjectModel model =
//         ModalRoute.of(context)?.settings.arguments as SubjectModel;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(model.title),
//       ),
//       floatingActionButton: GlobalData.designation == 'Teacher'
//           ? FloatingActionButton(
//               backgroundColor: oceanBlue,
//               onPressed: (() {
//                 showDialog(
//                     context: context,
//                     builder: (context) => PopupBox(
//                           title: "Add Assignment",
//                           labelInput1: "Title",
//                           labelInput2: "Doc Link",
//                           hintInput1: 'Assignment Name',
//                           hintInput2: 'Assignment Link',
//                         ));
//               }),
//               child: const Icon(
//                 Icons.add,
//               ),
//             )
//           : null,
//       body: ListView(
//         children: [
//           IntroCard(model.title, model.teacherFirstName),
//           SizedBox(
//             width: double.infinity,
//             height: MediaQuery.of(context).size.height -
//                 200 -
//                 MediaQuery.of(context).padding.top -
//                 kToolbarHeight,
//             child: ListView.builder(
//               itemBuilder: (context, index) =>
//                   NotesItemCard(assignmentsData.elementAt(index)),
//               itemCount: assignmentsData.length,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ClassRoomScreen extends StatefulWidget {
  const ClassRoomScreen({Key? key}) : super(key: key);

  static const route = '/classroom_screen';
  static SubjectModel currentSubjectModel = SubjectModel();

  @override
  State<ClassRoomScreen> createState() => _ClassRoomScreenState();
}

class _ClassRoomScreenState extends State<ClassRoomScreen> {
  List<AssignmentDataModel> assignmentsData = [];

  final TextEditingController _resetEmailTextController =
      TextEditingController();

  List<AssignmentDataModel> oldAssignmentsData = [];
  List<AssignmentDataModel> newAssignmentsData = [];

  List<AssignmentDataModel> totalAssignmentsData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    () async {
      await loadAssignmentModelsData().whenComplete(() {
        if (!mounted) return;
        setState(() {});
      });
    }();
  }

  Future loadAssignmentModelsData() async {
    // if (GlobalData.allStudentModelList.isEmpty) {
    //   GlobalData.allStudentModelList =
    //   await GetIt.I.get<FirebaseService>().getAllStudentModelList();
    // }

    oldAssignmentsData = [];
    newAssignmentsData = [];

    assignmentsData = await GetIt.I
        .get<FirebaseService>()
        .getAssignmentDataModelListBySubjectId(
            ClassRoomScreen.currentSubjectModel.id);

    assignmentsData.sort((a, b) {
      var comparisonResult = a.dueDate.compareTo(b.dueDate);
      return comparisonResult;
    });

    Timestamp ts = Timestamp.now();
    List<AssignmentDataModel> tempAssignmentsData = [];

    for (int i = 0; i < assignmentsData.length; i++) {
      if (assignmentsData[i].dueDate.compareTo(ts) > 0) {
        newAssignmentsData.add(assignmentsData[i]);
      }
    }
    for (int i = assignmentsData.length - 1; i >= 0; i--) {
      if (assignmentsData[i].dueDate.compareTo(ts) <= 0) {
        oldAssignmentsData.add(assignmentsData[i]);
      }
    }

    totalAssignmentsData = [
      ...newAssignmentsData,
      // ...newAssignmentsData.reversed.toList(),
      ...oldAssignmentsData
    ];
  }

  @override
  Widget build(BuildContext context) {
    // final SubjectModel model =
    //     ModalRoute.of(context)?.settings.arguments as SubjectModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(ClassRoomScreen.currentSubjectModel.title),
      ),
      floatingActionButton: GlobalData.isTeacher
          ? FloatingActionButton(
              backgroundColor: oceanBlue,
              onPressed: (() async {
                await showDialog(
                  context: context,
                  builder: (context) => TeacherPopupBox(),
                );
                await loadAssignmentModelsData().whenComplete(() {
                  setState(() {
                    totalAssignmentsData;
                  });
                });
              }),
              child: const Icon(
                Icons.add,
              ),
            )
          : null,
      body: ListView(
        children: [
          IntroCard(
              ClassRoomScreen.currentSubjectModel.title,
              '${ClassRoomScreen.currentSubjectModel.teacherFirstName} ${ClassRoomScreen.currentSubjectModel.teacherLastName}',
              ClassRoomScreen.currentSubjectModel.assetName),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height -
                120 -
                MediaQuery.of(context).padding.top -
                kToolbarHeight,
            child: ListView.builder(
              itemBuilder: (context, index) => NotesItemCard(
                totalAssignmentsData.elementAt(index),
                showAttachments: true,
              ),
              itemCount: totalAssignmentsData.length,
            ),
          ),
        ],
      ),
    );
  }
}
