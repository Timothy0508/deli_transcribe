import 'package:flutter/material.dart';

import '../api/database.dart';
import '../modules/transcriptions.dart';
import '../routes/transcription_page.dart';

class ProjectListTile extends StatefulWidget {
  final Transcriptions project;

  const ProjectListTile({super.key, required this.project});

  @override
  State<StatefulWidget> createState() => _ProjectListTileState();
}

class _ProjectListTileState extends State<ProjectListTile> {
  @override
  Widget build(BuildContext context) {
    var isar = Database.isar;

    return ListTile(
      leading:
          widget.project.isVideo == true
              ? Icon(Icons.videocam)
              : Icon(Icons.audiotrack),
      title: Text(widget.project.title ?? ''),
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TranscriptionPage(project: widget.project),
            ),
          ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await isar.writeTxn(() async {
            await isar.transcriptions.delete(widget.project.id);
          });
        },
      ),
    );
  }
}
