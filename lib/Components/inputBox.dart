import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String title;
  final String hint;
  InputBox({required this.title, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35, right: 35),
      child: TextField(
          // style: TextStyle(color: Colors.red),
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: title,
              hintText: hint,
              border: OutlineInputBorder())),
    );
  }
}
