import 'package:ekaksha/home/login/login_screen.dart';
import 'package:ekaksha/home/profile/screen/widget/teacher_cover.dart';
import 'package:ekaksha/home/profile/screen/widget/teacher_details_segment.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'widget/student_cover.dart';
import 'widget/student_details_segment.dart';
import 'widget/student_score_segment.dart';
import 'widget/student_subjects_segment.dart';

import '../../../utils/value/colors.dart';
import '../../../utils/widget/leading_icon_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          !GlobalData.isTeacher ? const StudentCover() : const TeacherCover(),
          !GlobalData.isTeacher ? const StudentDetailsSegment() : const TeacherDetailsSegment(),
          if (!GlobalData.isTeacher) ...[
            const Divider(),
            const StudentScoreSegment(),
          ],
          const Divider(),
          StudentSubjectsSegment(GlobalData.subjectModels),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: LeadingIconText(
              icon: Icons.lock_reset,
              label: 'Reset Password',
              labelColor: alertRed,
              iconColor: alertRed,
              callback: () => GetIt.I
                  .get<FirebaseService>()
                  .firebaseAuthResetPassword(
                    context: context,
                    email: GetIt.I.get<FirebaseService>().getCurrentUserEmail(),
                    onSuccessfulResetPassword: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Reset Link has been sent to the mail"),
                        ),
                      );
                    },
                  ),
            ),
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: LeadingIconText(
              icon: Icons.logout_rounded,
              label: 'Logout',
              labelColor: alertRed,
              iconColor: alertRed,
              callback: () =>
                  Navigator.of(context).pushReplacementNamed(LoginScreen.route),
            ),
          ),
        ],
      ),
    );
  }
}
