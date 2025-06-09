import 'package:flutter/material.dart';

class OcrPage extends StatefulWidget {
  const OcrPage({super.key});

  @override
  State<StatefulWidget> createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OCR')),
      body: Center(child: Text('OCR Page')),
    );
  }
}
