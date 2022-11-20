import 'package:ekaksha/dummy_data.dart';
import 'package:ekaksha/home/class/classroom_screen.dart';
import 'package:ekaksha/home/profile/screen/widget/student_details_segment.dart';
import 'package:ekaksha/utils/widget/leading_icon_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/value/colors.dart';
import 'widget/student_cover.dart';
import 'widget/student_score_segment.dart';
import 'widget/student_subjects_segment.dart';

// fresher, sophomore, junior, senior

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Coming Soon...',
        style: TextStyle(fontSize: 36, fontFamily: 'Poppins'),
      ),
    );
  }
}
