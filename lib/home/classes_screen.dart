import 'package:ekaksha/utils/data/global_data.dart';
import 'package:flutter/material.dart';

import '../menu/drawer_menu.dart';
import 'widget/class_item_card.dart';

class ClassesScreen extends StatelessWidget {
  static const route = '/classes_screen';

  const ClassesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(GlobalData.subjectModels.runtimeType);
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text(
          "eKaksha",
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            ClassItemCard(GlobalData.subjectModels.elementAt(index)),
        itemCount: GlobalData.subjectModels.length,
      ),
    );
  }
}
