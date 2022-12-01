import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({Key? key}) : super(key: key);
  static const route = '/pdf_viewer';

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    Uint8List documentBytes = data['documentBytes'];

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
}
