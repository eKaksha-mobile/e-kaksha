import 'package:flutter/material.dart';

class CheckBoxTextCard extends StatefulWidget {
  CheckBoxTextCard({Key? key, required this.callback, required this.label})
      : super(key: key);
  final Function(bool) callback;
  final String label;

  @override
  State<CheckBoxTextCard> createState() => _CheckBoxTextCardState();
}

class _CheckBoxTextCardState extends State<CheckBoxTextCard> {
  var _value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: Row(
        children: [
          Checkbox(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value as bool;
                  widget.callback(_value);
                });
              }),
          Text(
            widget.label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
