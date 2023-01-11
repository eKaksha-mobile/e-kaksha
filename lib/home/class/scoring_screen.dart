import 'package:ekaksha/utils/model/student_model.dart';
import 'package:ekaksha/utils/service/firebase_service.dart';
import 'package:ekaksha/utils/model/assignment_submitted_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../../utils/data/global_data.dart';
import '../../utils/widget/horizontal_spacer.dart';

class ScoringScreen extends StatefulWidget {
  static const route = '/scoring_screen';
  static AssignmentSubmittedDataModel assignmentSubmittedDataModel =
      AssignmentSubmittedDataModel();

  const ScoringScreen({Key? key}) : super(key: key);

  @override
  State<ScoringScreen> createState() => _ScoringScreenState();
}

class _ScoringScreenState extends State<ScoringScreen> {
  bool isLateSubmission = false;
  double hintMarks = 0.0;
  int maxMarks = 0;
  double hintPlagiarism = 0.0;
  double score = 0.0;

  String extractedText = '';

  StudentModel studentModel = StudentModel();

  DateTime submittedOn = DateTime.now();

  final TextEditingController marksController = TextEditingController();
  final TextEditingController plagiarismController = TextEditingController();

  @override
  void initState() {
    super.initState();
    () async {
      await initializeFields();
      setState(() {});
    }();
  }

  Future initializeFields() async {
    isLateSubmission =
        ScoringScreen.assignmentSubmittedDataModel.lateSubmission;
    // isLateSubmission = true;
    score = ScoringScreen.assignmentSubmittedDataModel.marks.toDouble();
    maxMarks = ScoringScreen.assignmentSubmittedDataModel.maxMarks;
    plagiarismController.text =
        ScoringScreen.assignmentSubmittedDataModel.plagiarizedAmount.toString();

    submittedOn =
        ScoringScreen.assignmentSubmittedDataModel.submittedOn.toDate();

    studentModel = await GetIt.I.get<FirebaseService>().getStudentModel(
        ScoringScreen.assignmentSubmittedDataModel.studentEmail);
  }

  void calculateScore() {
    if (checkErrors()) {
      score = (double.parse(marksController.text) / maxMarks) * 100;

      // print(score);
      // print((double.parse(plagiarismController.text) / 200));

      score = (score * (1 - (double.parse(plagiarismController.text) / 200)));
      if (isLateSubmission) {
        score = (score * (0.7));
      }
      // print(score);
    }
  }

  bool checkErrors() {
    if (double.parse(marksController.text) < 0 ||
        double.parse(marksController.text) > maxMarks ||
        double.parse(plagiarismController.text) < 0 ||
        double.parse(plagiarismController.text) > 100) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Enter value between 0 and 100")));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Card(
          margin: const EdgeInsets.all(10),
          elevation: .5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://cdn3d.iconscout.com/3d/premium/thumb/graduate-student-6368706-5250853.png')),
                const HorizontalSpacer(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${studentModel.firstName} ${studentModel.lastName}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      '${studentModel.semester}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        // TextButton(
        //   onPressed: () {},
        //   child: const Text(
        //     'Open submission',
        //     style: TextStyle(
        //       fontSize: 18,
        //       fontFamily: 'Poppins',
        //     ),
        //   ),
        // ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Text(
                'Submitted on:',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
              const HorizontalSpacer(10),
              Text(
                DateFormat("yyyy-MM-dd").format(submittedOn),
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: TextField(
                  controller: marksController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    hintText: hintMarks.toString(),
                    // suffixText: '/100',
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                  ),
                ),
              ),
              const HorizontalSpacer(10),
              Text(
                '/ $maxMarks',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(children: [
            SizedBox(
              width: 100,
              child: TextField(
                controller: plagiarismController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: hintPlagiarism.toString(),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
              ),
            ),
            const HorizontalSpacer(10),
            if (GlobalData.isTeacher) TextButton(
              onPressed: () {},
              child: const Text(
                'Re-Analyze',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ]),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Text(
                'Late submission?',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
              const HorizontalSpacer(10),
              Text(
                isLateSubmission ? 'True' : 'False',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Text('Score:',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  )),
              const HorizontalSpacer(10),
              Text(score.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
        if (GlobalData.isTeacher) Expanded(
            child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() => calculateScore());
              },
              child: const Text('Mask as checked'),
            ),
          ),
        )),
      ]),
    );
  }
}
