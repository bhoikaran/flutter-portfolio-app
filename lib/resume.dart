import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  final String assetPath = 'assets/KaranBhoiAndroidDeveloper.pdf';
  String? localPath;
  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  Future<void> loadPdf() async {
    try {
      final data = await rootBundle.load(assetPath);
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/sample.pdf');
      await file.writeAsBytes(data.buffer.asUint8List());

      setState(() {
        localPath = file.path;
      });
    } catch (e) {
      debugPrint('Error loading PDF from assets: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(163, 0, 0, 0),
      appBar: AppBar(
        title: Text("Resume"),
      ),
      body: localPath == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : PDFView(
              filePath: localPath!,
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: true,
              pageFling: true,
              onRender: (pages) {
                debugPrint('Document has $pages pages');
              },
              onError: (error) {
                debugPrint('Error loading PDF: $error');
              },
              onPageError: (page, error) {
                debugPrint('Error on page $page: $error');
              },
            ),
    );
  }
}
