import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekaksha/utils/value/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class InputText extends StatefulWidget {
  final String label;
  final String hint;
  final bool isMultiLineKeyboard;
  final bool isDateTimeField;
  final TextEditingController controller;
  // keyboardType: TextInputType.multiline,
  // maxLines: null
  InputText({
    required this.label,
    required this.hint,
    required this.controller,
    this.isMultiLineKeyboard = false,
    this.isDateTimeField = false,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  String dueDateTime = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            TextField(
              controller: widget.controller,
              style: const TextStyle(
                color: lightGrey,
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
              keyboardType: widget.isMultiLineKeyboard
                  ? TextInputType.multiline
                  : TextInputType.text,
              maxLines: widget.isMultiLineKeyboard ? null : 1,
              // expands: widget.isMultiLineKeyboard ? true : false,

              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: const TextStyle(color: extraLightGrey),
                border: InputBorder.none,
              ),
            ),
            widget.isDateTimeField
                ? Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true, onConfirm: (date) {
                            // print('confirm $date');

                            dueDateTime = DateFormat("yyyy-MM-dd").format(date);

                            // Timestamp ts =
                            //     Timestamp.fromDate(DateTime.parse(dueDateTime));
                            // print('ts');
                            // print(ts.toString());

                            DatePicker.showTimePicker(context,
                                showTitleActions: true, onConfirm: (date) {
                              // print('confirm $date');
                              dueDateTime = dueDateTime +
                                  ' ' +
                                  DateFormat.Hms().format(date);
                              // print(dueDateTime);

                              widget.controller.text = dueDateTime;
                            }, currentTime: DateTime.now());
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                        child: Text(
                          'Change Date&Time',
                        )),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

// Container(
// padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
// width: MediaQuery.of(context).size.width * 0.8,
// height: 88,
