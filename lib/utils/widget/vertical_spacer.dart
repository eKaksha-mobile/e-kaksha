import 'package:flutter/material.dart';

class VerticalSpacer extends StatelessWidget {
  final double spacing;

  const VerticalSpacer(this.spacing, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spacing);
  }
}
