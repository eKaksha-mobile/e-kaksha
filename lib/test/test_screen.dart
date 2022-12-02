import 'package:ekaksha/utils/service/plagiarism.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../utils/service/firebase_service.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late Uint8List documentBytes = Uint8List(0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    () async {
      await test();
      setState(() {});
    }();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = const Center(child: CircularProgressIndicator());
    if (documentBytes != null) {
      child = SfPdfViewer.memory(
        documentBytes!,
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion Flutter PDF Viewer')),
      body: child,
    );
  }

  Future test() async {
    documentBytes = (await GetIt.I.get<FirebaseService>().getPdfBytes(
        "assignments_data_pdf/0964934a-9646-46a1-a5b9-6cca307d562c/Assignment 2 BC.pdf"))!;

    var text = GetIt.I.get<FirebaseService>().extractText(documentBytes);

    await Plagiarism().getData(text);

    print('-------');

    await Plagiarism().getData(
        'Flutter is a free and open-source mobile UI framework created by Google and released in May 2017. In a few words, it allows you to create a native mobile application with only one codebase. This means that you can use one programming language and one codebase to create two different apps (for iOS and Android).');
  }
}
