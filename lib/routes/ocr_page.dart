import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../modules/ocr_project.dart';

class OcrPage extends StatefulWidget {
  final OcrProject? project;

  const OcrPage({super.key, this.project});

  @override
  State<StatefulWidget> createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    var title = widget.project?.title ?? 'Unnamed Project';
    var ocrResult = widget.project?.result;

    var appBar = AppBar(title: Text(title));

    var picturePane = Card(
      child: Center(
        child:
            _imagePath != null
                ? Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.file(File(_imagePath!)),
                )
                : FloatingActionButton.extended(
                  onPressed: () async {
                    var result = await FilePicker.platform.pickFiles(
                      type: FileType.image,
                    );
                    if (result == null) return;
                    debugPrint(result.files.first.path);
                    setState(() {
                      _imagePath = result.files.first.path;
                    });
                  },
                  icon: Icon(Icons.add_photo_alternate_outlined),
                  label: Text('Add picture'),
                ),
      ),
    );
    var textPane = Card(
      child:
          ocrResult != null
              ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SelectableText(ocrResult),
              )
              : Center(child: Text('No detection')),
    );

    return Scaffold(
      appBar: appBar,
      body: Row(
        children: [Expanded(child: picturePane), Expanded(child: textPane)],
      ),
    );
  }
}
