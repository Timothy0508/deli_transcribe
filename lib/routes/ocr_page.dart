import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../api/database.dart';
import '../modules/ocr_project.dart';

class OcrPage extends StatefulWidget {
  final OcrProject? project;

  const OcrPage({super.key, this.project});

  @override
  State<StatefulWidget> createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {
  String? _imagePath;
  String? _title;
  String? _ocrResult;

  @override
  Widget build(BuildContext context) {
    _title ??= widget.project?.title;
    _ocrResult ??= widget.project?.result;
    _imagePath ??= widget.project?.imagePath;

    var appBar = AppBar(title: Text(_title ?? 'Unnamed Project'));

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
                      _title = result.files.first.name;
                    });
                  },
                  icon: Icon(Icons.add_photo_alternate_outlined),
                  label: Text('Add picture'),
                ),
      ),
    );
    var textPane = Card(
      child:
          _ocrResult != null
              ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SelectableText(_ocrResult ?? ''),
              )
              : Center(child: Text('No detection')),
    );

    return Scaffold(
      appBar: appBar,
      body: Row(
        children: [Expanded(child: picturePane), Expanded(child: textPane)],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                var isar = Database.isar;
                await isar.writeTxn(() async {
                  var project = widget.project ?? OcrProject();
                  project.title = _title;
                  project.imagePath = _imagePath;
                  project.result = _ocrResult;
                  isar.ocrProjects.put(project);
                });
              },
              label: Text('Save'),
              icon: Icon(Icons.save),
            ),
          ],
        ),
      ),
    );
  }
}
