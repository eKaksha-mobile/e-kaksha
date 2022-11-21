import 'package:ekaksha/utils/model/ClassModel.dart';
import 'package:flutter/material.dart';

import '../../../../utils/value/colors.dart';
import '../../../../utils/widget/leading_icon_text.dart';
import '../../../class/classroom_screen.dart';
// import '../../../../model/ClassModel.dart';

class StudentSubjectsSegment extends StatelessWidget {
  final List<ClassModel> subjects;

  const StudentSubjectsSegment(this.subjects, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Column(
        children: [
          ...subjects.map((e) => LeadingIconText(
              icon: Icons.laptop_windows_outlined,
              labelColor: navyBlue,
              iconColor: oceanBlue,
              label: e.title,
              callback: () {
                Navigator.of(context)
                    .pushNamed(ClassRoomScreen.route, arguments: e);
              }))
        ],
      ),
    );
  }
}
