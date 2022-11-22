import 'package:ekaksha/dummy_data.dart';
import 'package:ekaksha/home/profile/screen/widget/leaderboard_item.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/model/student_model.dart';
// import 'package:ekaksha/utils/model/ClassModel.dart';
import 'package:ekaksha/utils/model/subject_model.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../utils/value/colors.dart';
// import '../../../model/ClassModel.dart';

// fresher, sophomore, junior, senior

// class LeaderboardScreen1 extends StatelessWidget {
//   LeaderboardScreen1({Key? key}) : super(key: key);
//   // final List<SubjectModel> classes = GlobalData.subjectModels;
//   List<StudentModel> studentList = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 5),
//       child: ListView.builder(
//         itemBuilder: (context, index) => LeaderboardItem(
//           studentList.elementAt(index),
//           index: index + 1,
//         ),
//         itemCount: studentList.length,
//       ),
//     );
//   }
//
//   Future loadLeaderboardData(studentList) async {
//     if (GlobalData.allStudentModelList.isEmpty) {
//       GlobalData.allStudentModelList =
//           await GetIt.I.get<FirebaseService>().getAllStudentModelList();
//     }
//
//     studentList = GlobalData.allStudentModelList;
//
//     studentList.sort((b, a) {
//       var comparisonResult = a.semester.compareTo(b.semester);
//       if (comparisonResult != 0) {
//         return comparisonResult;
//       }
//       // Surnames are the same, so subsort by given name.
//       return a.totalScore.compareTo(b.totalScore);
//     });
//   }
// }

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<StudentModel> studentList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    () async {
      await loadLeaderboardStudentsData().whenComplete(() {
        setState(() {});
      });
    }();
  }

  Future loadLeaderboardStudentsData() async {
    if (GlobalData.allStudentModelList.isEmpty) {
      GlobalData.allStudentModelList =
          await GetIt.I.get<FirebaseService>().getAllStudentModelList();
    }

    studentList = GlobalData.allStudentModelList;

    studentList.sort((b, a) {
      var comparisonResult = a.semester.compareTo(b.semester);
      if (comparisonResult != 0) {
        return comparisonResult;
      }
      // Surnames are the same, so subsort by given name.
      return a.totalScore.compareTo(b.totalScore);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: ListView.builder(
        itemBuilder: (context, index) => LeaderboardItem(
          studentList.elementAt(index),
          index: index + 1,
        ),
        itemCount: studentList.length,
      ),
    );
  }
}
