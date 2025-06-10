import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../api/database.dart';
import '../modules/transcriptions.dart';
import '../widgets/project_list_tile.dart';

class TranscriptionProjectPane extends StatefulWidget {
  const TranscriptionProjectPane({super.key});

  @override
  State<StatefulWidget> createState() => _TranscriptionProjectPaneState();
}

class _TranscriptionProjectPaneState extends State<TranscriptionProjectPane> {
  late Isar _isar;

  @override
  void initState() {
    _isar = Database.isar;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var db = _isar.transcriptions;
    var projectStream = db.where().watch(fireImmediately: true);
    var body = StreamBuilder(
      stream: projectStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final project = snapshot.data;
        if (project == null || project.isEmpty) {
          return Text('Cannot find projects');
        }

        return ListView.builder(
          itemBuilder:
              (context, index) => ProjectListTile(project: project[index]),
          itemCount: project.length,
        );
      },
    );

    return Card(child: body);
  }
}
