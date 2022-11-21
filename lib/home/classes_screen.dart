// import 'package:ekaksha/model/student_model.dart';
import 'package:ekaksha/utils/data/global_data.dart';
import 'package:ekaksha/utils/model/ClassModel.dart';
import 'package:flutter/material.dart';

import 'package:ekaksha/dummy_data.dart';

import '../menu/drawer_menu.dart';
import 'widget/class_item_card.dart';
// import '../model/ClassModel.dart';

class ClassesScreen extends StatelessWidget {
  static const route = '/classes_screen';

  const ClassesScreen({Key? key}) : super(key: key);

  final List<ClassModel> classes = dummyClasses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text(
          "EKaksha",
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            ClassItemCard(classes.elementAt(index)),
        itemCount: classes.length,
      ),
    );
  }
}
