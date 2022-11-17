import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.heading, required this.icon})
      : super(key: key);
  final IconData icon;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black87,
        ),
        title: Text(
          heading,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
