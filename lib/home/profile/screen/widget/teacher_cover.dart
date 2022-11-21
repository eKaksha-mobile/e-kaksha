import 'package:ekaksha/utils/data/global_data.dart';
import 'package:flutter/material.dart';

// import '../../../../model/student_model.dart';
import '../../../../utils/value/style.dart';
import '../../../../utils/widget/horizontal_spacer.dart';

class TeacherCover extends StatelessWidget {
  // final StudentModel student;

  const TeacherCover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage(
                'https://static.wikia.nocookie.net/callofduty/images/1/18/SimonRiley_Mobile.jpg/revision/latest?cb=20191005151053'),
          ),
          const HorizontalSpacer(25),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${GlobalData.teacherModel.firstName} ${GlobalData.teacherModel.lastName}',
                style: textStyle3,
              ),
              Text(
                '${GlobalData.teacherModel.gender}, ${GlobalData.teacherModel.age}',
                style: textStyle4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}