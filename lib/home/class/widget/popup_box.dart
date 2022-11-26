import 'package:ekaksha/home/widget/input_text.dart';
import 'package:ekaksha/utils/widget/vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TeacherPopupBox extends StatelessWidget {
  TeacherPopupBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      actionsPadding: const EdgeInsets.only(bottom: 10, right: 15),
      title: const Text(
        "Add New Assignment",
        textAlign: TextAlign.center,
      ),
      scrollable: false,
      content: SizedBox(
        child: ListView(
          children: [
            InputText(
              label: 'Assignment Name',
              hint: 'Title',
            ),
            InputText(
              label: 'Description',
              hint: "Brief Description",
            ),
            InputText(
              label: 'Due Date',
              hint: 'DD/MM/YYYY',
            ),
            InputText(
              label: 'Maximum Marks',
              hint: "Max Marks",
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Upload File',
              textAlign: TextAlign.center,
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text(
              'ADD',
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
//
// SizedBox(
// height: MediaQuery.of(context).size.height * 0.3,

class PopupBox extends StatelessWidget {
  PopupBox(
      {super.key,
      required this.title,
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
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      scrollable: false,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          children: [
            InputText(
              label: labelInput1,
              hint: hintInput1,
            ),
            labelInput2.isNotEmpty
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
//
// SizedBox(
// height: MediaQuery.of(context).size.height * 0.3,
