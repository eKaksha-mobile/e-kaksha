import 'package:ekaksha/utils/value/colors.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String label;
  final String hint;
  InputText({required this.label, required this.hint});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 88,
        // shape: ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            TextField(
              // controller: widget.controller,
              style: const TextStyle(
                color: lightGrey,
                fontFamily: 'Poppins',
                fontSize: 18,
              ),
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
