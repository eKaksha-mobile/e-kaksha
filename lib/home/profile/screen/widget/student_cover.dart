import 'package:ekaksha/utils/data/global_data.dart';
import 'package:flutter/material.dart';

// import '../../../../model/student_model.dart';
import '../../../../utils/value/style.dart';
import '../../../../utils/widget/horizontal_spacer.dart';

class StudentCover extends StatelessWidget {
  // final StudentModel student;

  const StudentCover({Key? key}) : super(key: key);

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
            backgroundImage: NetworkImage('https://cdn3d.iconscout.com/3d/premium/thumb/graduate-student-6368706-5250853.png'),
          ),
          const HorizontalSpacer(25),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${GlobalData.studentModel.firstName} ${GlobalData.studentModel.lastName}',
                style: textStyle3,
              ),
              Text(
                '${GlobalData.studentModel.gender}, ${GlobalData.studentModel.age}',
                style: textStyle4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
