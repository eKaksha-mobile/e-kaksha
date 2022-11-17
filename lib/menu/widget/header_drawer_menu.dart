import 'package:ekaksha/model/student_model.dart';
import 'package:flutter/material.dart';

class DrawerMenuHeader extends StatelessWidget {
  final StudentModel model;

  const DrawerMenuHeader(this.model, {Key? key}) : super(key: key);

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
            model.name,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
          Text(
            model.email,
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
