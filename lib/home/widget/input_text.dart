import 'package:ekaksha/utils/value/colors.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String label;
  final String hint;
  final bool isMultiLineKeyboard;
  // keyboardType: TextInputType.multiline,
  // maxLines: null
  InputText(
      {required this.label,
      required this.hint,
      this.isMultiLineKeyboard = false});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
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
                fontSize: 10,
              ),
            ),
            TextField(
              // controller: widget.controller,
              style: const TextStyle(
                color: lightGrey,
                fontFamily: 'Poppins',
                fontSize: 10,
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
