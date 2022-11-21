import 'package:ekaksha/dummy_data.dart';
import 'package:ekaksha/home/profile/screen/widget/leaderboard_item.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/model/student_model.dart';
// import 'package:ekaksha/utils/model/ClassModel.dart';
import 'package:ekaksha/utils/model/subject_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/value/colors.dart';
// import '../../../model/ClassModel.dart';

// fresher, sophomore, junior, senior

class LeaderboardScreen extends StatelessWidget {
  LeaderboardScreen({Key? key}) : super(key: key);
  // final List<SubjectModel> classes = GlobalData.subjectModels;

  List<StudentModel> studentList = GlobalData.allStudentModelList;

  @override
  Widget build(BuildContext context) {
    studentList.sort((b, a) {
      var comparisonResult = a.semester.compareTo(b.semester);
      if (comparisonResult != 0) {
        return comparisonResult;
      }
      // Surnames are the same, so subsort by given name.
      return a.totalScore.compareTo(b.totalScore);
    });
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
