import 'package:flutter/material.dart';

import '../modules/ocr_project.dart';

class OcrPage extends StatefulWidget {
  final OcrProject? project;

  const OcrPage({super.key, this.project});

  @override
  State<StatefulWidget> createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {
  Image? _image;

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text(widget.project?.title ?? 'Unnamed Project'),
    );

    var picturePane = Card(
      child: Center(
        child:
            _image ??
            FloatingActionButton.extended(
              onPressed: null,
              icon: Icon(Icons.add_photo_alternate_outlined),
              label: Text('Add picture'),
            ),
      ),
    );
    var textPane = Card(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SelectableText('test'),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Row(
        children: [Expanded(child: picturePane), Expanded(child: textPane)],
      ),
    );
  }
}
