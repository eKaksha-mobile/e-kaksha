// import 'package:ekaksha/model/student_model.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:flutter/material.dart';

import '../../../../utils/value/colors.dart';
import '../../../../utils/widget/leading_icon_text.dart';

class StudentDetailsSegment extends StatelessWidget {
  // final StudentModel model;

  const StudentDetailsSegment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Column(
        children: [
          LeadingIconText(
            icon: Icons.perm_identity_rounded,
            label: GlobalData.studentModel.rollNo.toString(),
            iconSize: 18.0,
            labelSize: 17.0,
            verticalMargin: 10.0,
            iconColor: lightGrey,
            labelColor: lightGrey,
          ),
          LeadingIconText(
            icon: Icons.phone_enabled_outlined,
            label: GlobalData.studentModel.mobile.toString(),
            iconSize: 18.0,
            labelSize: 17.0,
            verticalMargin: 10.0,
            iconColor: lightGrey,
            labelColor: lightGrey,
          ),
          LeadingIconText(
            icon: Icons.email_outlined,
            label: GlobalData.studentModel.email,
            iconSize: 18.0,
            labelSize: 17.0,
            verticalMargin: 10.0,
            iconColor: lightGrey,
            labelColor: lightGrey,
          ),
          LeadingIconText(
            icon: Icons.school_outlined,
            label: '${GlobalData.studentModel.semester} semester',
            iconSize: 18.0,
            labelSize: 17.0,
            verticalMargin: 10.0,
            iconColor: lightGrey,
            labelColor: lightGrey,
          )
        ],
      ),
    );
  }
}
