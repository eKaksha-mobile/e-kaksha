import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.imageName});
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageName,
      fit: BoxFit.fitWidth,
      width: 300,
      height: 300,
      color: Colors.white,
    );
  }
}
