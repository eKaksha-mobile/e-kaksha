import 'package:flutter/material.dart';
import '../../widget/constant.dart';

class StudentIntroCard extends StatelessWidget {
  final String text1;
  final String text2;

  const StudentIntroCard({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 180,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        image: const DecorationImage(
            image: AssetImage('assets/images/banner9.jpg'), fit: BoxFit.cover),
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
            text1,
            style: smText,
          ),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            width: 200,
            child: Text(
              text2,
              style: smText.copyWith(fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
