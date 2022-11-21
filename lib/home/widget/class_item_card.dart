import 'package:ekaksha/home/class/classroom_screen.dart';
// import 'package:ekaksha/utils/model/ClassModel.dart';/
import 'package:ekaksha/utils/model/subject_model.dart';
import 'package:ekaksha/utils/widget/horizontal_spacer.dart';
import 'package:ekaksha/utils/widget/vertical_spacer.dart';
import 'package:flutter/material.dart';

// import '../../model/ClassModel.dart';

class ClassItemCard extends StatelessWidget {
  final SubjectModel _subjectModel;

  const ClassItemCard(this._subjectModel, {Key? key}) : super(key: key);

  void _navigateToClassroom(BuildContext context) {
    Navigator.of(context)
        .pushNamed(ClassRoomScreen.route, arguments: _subjectModel);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return InkWell(
      onTap: () => _navigateToClassroom(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 3),
        child: Stack(children: [
          Card(
            elevation: 5,
            child: SizedBox(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.24,
              child: Image(
                image: AssetImage(_subjectModel.assetName),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: mediaQuery.size.width * 0.75,
                  child: Text(
                    _subjectModel.title,
                    style: const TextStyle(
                        overflow: TextOverflow.visible,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        height: 1.2,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const VerticalSpacer(5),
                Text(
                  '${_subjectModel.teacherFirstName} ${_subjectModel.teacherLastName}',
                  style: const TextStyle(
                      overflow: TextOverflow.visible,
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
