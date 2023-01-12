import 'package:flutter/material.dart';

class HorizontalSpacer extends StatelessWidget {
  final double spacing;

  const HorizontalSpacer(this.spacing, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: spacing);
  }
}
