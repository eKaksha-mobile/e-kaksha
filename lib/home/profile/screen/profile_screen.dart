import 'package:flutter/material.dart';

import 'widget/student_cover.dart';
import 'widget/student_details_segment.dart';
import 'widget/student_score_segment.dart';
import 'widget/student_subjects_segment.dart';

import '../../../dummy_data.dart';
import '../../../utils/value/colors.dart';
import '../../../utils/widget/leading_icon_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StudentCover(dummyStudent),
          StudentDetailsSegment(dummyStudent),
          const Divider(),
          const StudentScoreSegment(75.43, 1),
          const Divider(),
          const StudentSubjectsSegment(dummyClasses),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: const LeadingIconText(
              icon: Icons.logout_rounded,
              label: 'Logout',
              labelColor: alertRed,
              iconColor: alertRed,
            ),
          ),
        ],
      ),
    );;
  }
}
