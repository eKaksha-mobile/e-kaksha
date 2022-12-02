import 'package:ekaksha/home/class/widget/score_popup.dart';
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(hintText: '10'),
                ),
              ),
              Text('/100'),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(hintText: '10'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Analyze',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    ),
                  )),
            ],
          ),
          Row(
            children: [
              Text('Late submission?'),
              Text('True'),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Text('Total Score:',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                    )),
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
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Mask as checked'),
            ),
          ),
        ],
      ),
    );
  }
}
