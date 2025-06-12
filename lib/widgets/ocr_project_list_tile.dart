import 'package:flutter/material.dart';

import '../api/database.dart';
import '../modules/ocr_project.dart';
import '../routes/ocr_page.dart';

class OcrProjectListTile extends StatefulWidget {
  final OcrProject project;

  const OcrProjectListTile({super.key, required this.project});

  @override
  State<StatefulWidget> createState() => _OcrProjectListTileState();
}

class _OcrProjectListTileState extends State<OcrProjectListTile> {
  @override
  Widget build(BuildContext context) {
    var isar = Database.isar;

    return ListTile(
      title: Text(widget.project.title ?? ''),
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OcrPage(project: widget.project),
            ),
          ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await isar.writeTxn(() async {
            await isar.ocrProjects.delete(widget.project.id);
          });
        },
      ),
    );
  }
}
