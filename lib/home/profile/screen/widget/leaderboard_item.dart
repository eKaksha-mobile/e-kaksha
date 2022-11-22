import 'package:ekaksha/utils/model/student_model.dart';
import 'package:flutter/material.dart';

class LeaderboardItem extends StatelessWidget {
  final StudentModel _studentModel;
  final int index;

  const LeaderboardItem(this._studentModel, {required this.index, super.key});

  EdgeInsetsGeometry getMargin(index) {
    if (index == 1) {
      return const EdgeInsets.symmetric(horizontal: 5, vertical: 5);
    } else if (index == 2) {
      return const EdgeInsets.symmetric(horizontal: 7, vertical: 5);
    } else if (index == 3) {
      return const EdgeInsets.symmetric(horizontal: 9, vertical: 5);
    } else {
      return const EdgeInsets.symmetric(horizontal: 12, vertical: 2);
    }
  }

  double getElevation(index) {
    if (index == 1) {
      return 5.0;
    } else if (index == 2) {
      return 4.0;
    } else if (index == 3) {
      return 3.0;
    } else {
      return 1.50;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: getMargin(index),
      elevation: getElevation(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/3011/3011270.png'),
                      radius: 22.5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${_studentModel.firstName} ${_studentModel.lastName}"
                              .toUpperCase(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins'),
                        ),
                        const SizedBox(
                          height: 1.5,
                        ),
                        Text(
                          "Score : ${_studentModel.totalScore}",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[200]),
                        ),
                        const SizedBox(
                          height: 1.5,
                        ),
                        Text(
                          "Semester : ${_studentModel.semester}",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[200]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              index == 1
                  ? const Image(
                      height: 45,
                      width: 45,
                      image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/7645/7645279.png' // 'https://cdn-icons-png.flaticon.com/512/2641/2641497.png'
                          ),
                    )
                  : index == 2
                      ? const Image(
                          height: 45,
                          width: 45,
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/7645/7645294.png'))
                      : index == 3
                          ? const Image(
                              height: 45,
                              width: 45,
                              image: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/7645/7645366.png'))
                          : const Image(height: 40, width: 40, image: NetworkImage(
                              // 'https://cdn-icons-png.flaticon.com/512/726/726271.png'
                              'https://cdn-icons-png.flaticon.com/512/477/477406.png'))
            ],
          )),
    );
  }
}
