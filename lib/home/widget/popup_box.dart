import 'package:ekaksha/home/widget/input_text.dart';
import 'package:flutter/material.dart';

class PopupBox extends StatelessWidget {
  PopupBox(
      {required this.title,
      required this.labelInput1,
      required this.labelInput2,
      this.hintInput1 = '',
      this.hintInput2 = ''});
  final String title;
  final String labelInput1;
  final String labelInput2;
  late String hintInput1;
  late String hintInput2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actionsPadding: const EdgeInsets.only(bottom: 10, right: 15),
      title: const Text(
        'New Assignment',
        textAlign: TextAlign.center,
      ),
      scrollable: false,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView(
          children: [
            InputText(
              label: labelInput1,
              hint: hintInput1,
            ),
            labelInput2.length != 0
                ? InputText(
                    label: labelInput2,
                    hint: hintInput2,
                  )
                : Container(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text('ADD'),
        ),
      ],
    );
  }
}
