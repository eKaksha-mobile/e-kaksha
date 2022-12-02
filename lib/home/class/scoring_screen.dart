import 'package:ekaksha/home/class/widget/score_popup.dart';
import 'package:flutter/material.dart';

class ScoringScreen extends StatelessWidget {
  static const route = '/scoring_screen';

  const ScoringScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => showDialog(context: context, builder: (context) => const ScorePopup()),
      //   child: const Icon(Icons.send),
      // ),
    );
  }
}
