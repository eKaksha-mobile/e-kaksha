import 'package:ekaksha/utils/model/assignment_submitted_data_model.dart';
import 'package:flutter/material.dart';

import '../scoring_screen.dart';

class SubmittedStudent extends StatelessWidget {
  final int index;
  final String data;
  final double marks;
  final int maxMarks;
  final double plagiarismAmount;
  final bool lateSubmission;
  final bool isChecked;
  final double score;
  final AssignmentSubmittedDataModel assignmentSubmittedDataModel;

  const SubmittedStudent(
    this.data, {
    super.key,
    required this.index,
    required this.marks,
    required this.maxMarks,
    required this.isChecked,
    required this.assignmentSubmittedDataModel,
    required this.plagiarismAmount,
    required this.lateSubmission,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScoringScreen.assignmentSubmittedDataModel =
            assignmentSubmittedDataModel;
        Navigator.of(context).pushNamed(ScoringScreen.route);
      },
      child: Card(
        elevation: .4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        backgroundImage: NetworkImage(
                            'https://cdn3d.iconscout.com/3d/premium/thumb/graduate-student-6368706-5250853.png'),
                        radius: 22.5,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data}".toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins'),
                              ),
                              const SizedBox(
                                height: 1.5,
                              ),
                              Text(
                                // "Marks : ${marks} / ${maxMarks}",
                                "Score : ${score}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueGrey[200]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(
                  isChecked
                      ? Icons.check_circle_outline
                      : Icons.circle_notifications_rounded,
                  size: 25,
                  color: isChecked ? Colors.green : Colors.redAccent,
                )
              ],
            )),
      ),
    );
  }
}
