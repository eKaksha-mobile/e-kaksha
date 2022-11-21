import 'package:ekaksha/dummy_data.dart';
import 'package:ekaksha/home/profile/screen/widget/leaderboard_item.dart';
import 'package:ekaksha/utils/model/ClassModel.dart';
import 'package:flutter/material.dart';

import '../../../utils/value/colors.dart';
// import '../../../model/ClassModel.dart';

// fresher, sophomore, junior, senior

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);
  final List<ClassModel> classes = dummyClasses;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: ListView.builder(
        itemBuilder: (context, index) => LeaderboardItem(
          index: index + 1,
        ),
        itemCount: 10,
      ),
    );
  }
}
