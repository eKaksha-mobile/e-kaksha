import 'package:flutter/material.dart';

class IntroCard extends StatelessWidget {
  final String _title;
  final String _subtitle;

  const IntroCard(this._title, this._subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 180,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.purple[200],
        image: const DecorationImage(
            image: AssetImage('assets/images/1.png'), fit: BoxFit.cover),
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 3.0,
            spreadRadius: 1.0,
            offset: Offset(1.0, 1.0), // shadow direction: bottom right
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title,
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: 200,
            child: Text(
              _subtitle,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
