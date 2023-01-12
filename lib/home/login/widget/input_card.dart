import 'package:flutter/material.dart';

import '../../../utils/value/colors.dart';

class InputCard extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final TextEditingController controller;

  static const _icons = [
    Icons.visibility_rounded,
    Icons.visibility_off_rounded
  ];

  const InputCard(
      {Key? key,
      required this.label,
      required this.hint,
      required this.isPassword,
      required this.controller})
      : super(key: key);

  @override
  State<InputCard> createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  int visibility = 0;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        width: mediaQuery.size.width * 0.8,
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
              controller: widget.controller,
              obscureText: visibility == 0 && widget.isPassword,
              enableSuggestions: !widget.isPassword,
              autocorrect: !widget.isPassword,
              style: const TextStyle(
                color: lightGrey,
                fontFamily: 'Poppins',
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: const TextStyle(color: extraLightGrey),
                border: InputBorder.none,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            visibility = visibility == 0 ? 1 : 0;
                          });
                        },
                        icon: Icon(
                          InputCard._icons.elementAt(visibility),
                          color: lightGrey,
                        ),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
