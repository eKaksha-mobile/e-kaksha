import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../utils/value/style.dart';

class StudentScoreSegment extends StatefulWidget {
  const StudentScoreSegment({Key? key}) : super(key: key);

  @override
  State<StudentScoreSegment> createState() => _StudentScoreSegmentState();
}

class _StudentScoreSegmentState extends State<StudentScoreSegment> {
  double totalScore = 0.0;
  int pending = 0;

  @override
  void initState() {
    super.initState();

    () async {
      totalScore = await GetIt.I.get<FirebaseService>().getTotalScore(
          GlobalData.studentModel.email, GlobalData.studentModel.semester);
      pending = await GetIt.I
          .get<FirebaseService>()
          .getPendingAssignments(GlobalData.studentModel.semester);

      GlobalData.studentModel.totalScore = totalScore;
      GlobalData.studentModel.pendingAssignments = pending;

      await GetIt.I
          .get<FirebaseService>()
          .updateStudentModel(GlobalData.studentModel.email, {
        'totalScore': totalScore,
        'pending': pending,
      });

      setState(() {});
    }();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                GlobalData.studentModel.totalScore.toStringAsFixed(2),
                style: textStyle1,
              ),
              const Text(
                'Total Score',
                style: textStyle2,
              ),
            ],
          ),
          const VerticalDivider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                GlobalData.studentModel.pendingAssignments.toString(),
                style: textStyle1,
              ),
              const Text(
                //was pending earlier
                'Upcoming',
                style: textStyle2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
