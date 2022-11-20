import 'package:ekaksha/utils/data/global_data.dart';
import 'package:flutter/material.dart';

import '../../../../utils/value/style.dart';
import '../../../../utils/widget/vertical_spacer.dart';

class StudentScoreSegment extends StatelessWidget {
  // final double score;
  // final int pending;

  const StudentScoreSegment({Key? key}) : super(key: key);

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
                GlobalData.studentModel.totalScore.toString(),
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
                'Pending',
                style: textStyle2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
