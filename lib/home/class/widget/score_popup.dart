import 'package:ekaksha/utils/widget/vertical_spacer.dart';
import 'package:flutter/material.dart';

import '../../login/widget/input_card.dart';
import 'package:numberpicker/numberpicker.dart';

class ScorePopup extends StatefulWidget {
  const ScorePopup({Key? key}) : super(key: key);

  @override
  State<ScorePopup> createState() => _ScorePopupState();
}

class _ScorePopupState extends State<ScorePopup> {
  int _currentValue = 50;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actionsPadding: const EdgeInsets.only(bottom: 10, right: 15),
      title: const Text('Reset Password'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            const VerticalSpacer(15),
            const Text(
              'Score',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
            const VerticalSpacer(15),
            NumberPicker(
              axis: Axis.horizontal,
              value: _currentValue,
              minValue: 0,
              maxValue: 100,
              onChanged: (value) => setState(() => _currentValue = value),
            ),
            const VerticalSpacer(5),
            const Divider(),
            OutlinedButton(onPressed: () {}, child: const Text('Analyze'),),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {

          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
