import 'package:ekaksha/home/class/widget/examiner_card.dart';
import 'package:ekaksha/home/class/widget/score_popup.dart';
import 'package:ekaksha/home/class/widget/submitted_student.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/widget/vertical_spacer.dart';
import 'package:flutter/material.dart';

import '../../utils/widget/horizontal_spacer.dart';
import '../login/widget/checkbox_text_card.dart';

class ScoringScreen extends StatefulWidget {
  static const route = '/scoring_screen';

  const ScoringScreen({Key? key}) : super(key: key);

  @override
  State<ScoringScreen> createState() => _ScoringScreenState();
}

class _ScoringScreenState extends State<ScoringScreen> {
  bool lateSubmission = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                        '${GlobalData.studentModel.firstName} ${GlobalData.studentModel.lastName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        '${GlobalData.studentModel.semester}',
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
          TextButton(
            onPressed: () {},
            child: const Text(
              'Open submission',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
          ),
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
                  '18 dec',
                  style: TextStyle(
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
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: '10',
                      // suffixText: '/100',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                    ),
                  ),
                ),
                const HorizontalSpacer(10),
                const Text(
                  '/ 100',
                  style: TextStyle(
                    fontSize: 18,
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
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: '10',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                  ),
                ),
                const HorizontalSpacer(10),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Analyze',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
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
                  'True',
                  style: TextStyle(
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
              children: const [
                Text(
                  'Total Score:',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
                HorizontalSpacer(10),
                Text('283',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Mask as checked'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
