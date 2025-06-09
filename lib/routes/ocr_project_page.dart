import 'package:flutter/material.dart';

import 'ocr_page.dart';

class OcrProjectPage extends StatefulWidget {
  const OcrProjectPage({super.key});

  @override
  State<StatefulWidget> createState() => _OcrProjectPageState();
}

class _OcrProjectPageState extends State<OcrProjectPage> {
  @override
  Widget build(BuildContext context) {
    var appBar = SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('OCR Projects'),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFDD61FF), Color(0xFF4FA7FF)],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: CustomScrollView(slivers: [appBar]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OcrPage()),
            ),
      ),
    );
  }
}
