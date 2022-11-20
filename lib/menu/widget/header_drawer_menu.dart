import 'package:ekaksha/model/student_model.dart';
import 'package:flutter/material.dart';

class DrawerMenuHeader extends StatelessWidget {
  final StudentModel student;

  const DrawerMenuHeader(this.student, {Key? key}) : super(key: key);

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
            '${student.firstName} ${student.lastName}',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
          Text(
            student.email,
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
