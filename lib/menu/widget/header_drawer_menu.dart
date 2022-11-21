// import 'package:ekaksha/model/student_model.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:flutter/material.dart';

class DrawerMenuHeader extends StatelessWidget {
  // final StudentModel student;

  const DrawerMenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);

    return Container(
      color: theme.primaryColor,
      height: mediaQuery.size.height * 0.2,
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '${GlobalData.studentModel.firstName} ${GlobalData.studentModel.lastName}',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
          Text(
            GlobalData.studentModel.email,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
