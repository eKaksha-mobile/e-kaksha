import 'package:flutter/material.dart';

class LeadingIconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const LeadingIconText(this.icon, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          WidgetSpan(child: Icon(icon, size: 16)),
          TextSpan(text: text),
        ],
      ),
    );
  }
}
