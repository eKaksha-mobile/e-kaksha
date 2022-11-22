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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    () async {
      await loadAssignmentModelsData().whenComplete(() {
        setState(() {});
      });
    }();
  }

  Future loadAssignmentModelsData() async {
    // if (GlobalData.allStudentModelList.isEmpty) {
    //   GlobalData.allStudentModelList =
    //   await GetIt.I.get<FirebaseService>().getAllStudentModelList();
    // }

    assignmentsData = await GetIt.I
        .get<FirebaseService>()
        .getAssignmentDataModelListBySubjectId(
            ClassRoomScreen.currentSubjectModel.id);

    // assignmentsData.sort((b, a) {
    //   var comparisonResult = a.semester.compareTo(b.semester);
    //   if (comparisonResult != 0) {
    //     return comparisonResult;
    //   }
    //   // Surnames are the same, so subsort by given name.
    //   return a.totalScore.compareTo(b.totalScore);
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final SubjectModel model =
    //     ModalRoute.of(context)?.settings.arguments as SubjectModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(ClassRoomScreen.currentSubjectModel.title),
      ),
      floatingActionButton: GlobalData.designation == 'Teacher'
          ? FloatingActionButton(
              backgroundColor: oceanBlue,
              onPressed: (() {
                showDialog(
                    context: context,
                    builder: (context) => PopupBox(
                          title: "Add Assignment",
                          labelInput1: "Title",
                          labelInput2: "Doc Link",
                          hintInput1: 'Assignment Name',
                          hintInput2: 'Assignment Link',
                        ));
              }),
              child: const Icon(
                Icons.add,
              ),
            )
          : null,
      body: ListView(
        children: [
          IntroCard(ClassRoomScreen.currentSubjectModel.title,
              ClassRoomScreen.currentSubjectModel.teacherFirstName),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height -
                200 -
                MediaQuery.of(context).padding.top -
                kToolbarHeight,
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  NotesItemCard(assignmentsData.elementAt(index)),
              itemCount: assignmentsData.length,
            ),
          ),
        ],
      ),
    );
  }
}
