import 'package:flutter/material.dart';

import '../../../utils/value/colors.dart';

class SpannableText extends StatelessWidget {
  final String label;
  final String action;
  final VoidCallback callback;

  const SpannableText(
      {super.key,
      required this.label,
      required this.action,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: lightGrey,
              fontSize: 15,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            action,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
