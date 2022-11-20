import 'package:ekaksha/home/class/classroom_screen.dart';
import 'package:flutter/material.dart';

import '../model/ClassModel.dart';

class ClassItemCard extends StatelessWidget {
  final ClassModel _classModel;

  const ClassItemCard(this._classModel, {Key? key}) : super(key: key);

  void _navigateToClassroom(BuildContext context) {
    Navigator.of(context).pushNamed(ClassRoomScreen.route, arguments: _classModel);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return InkWell(
      onTap: () => _navigateToClassroom(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Stack(children: [
          SizedBox(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height * 0.26,
            child: Image(
              image: AssetImage(_classModel.assetName),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _classModel.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      height: 1.2,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '${_classModel.teacherFirstName} ${_classModel.teacherLastName}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      height: 1.2,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}