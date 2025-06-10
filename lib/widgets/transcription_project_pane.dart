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
  TextEditingController _searchController = TextEditingController();

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
          return Expanded(child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Expanded(
            child: Center(child: Text('Error: ${snapshot.error}')),
          );
        }

        final project = snapshot.data;
        if (project == null || project.isEmpty) {
          return Expanded(child: Center(child: Text('Cannot find projects')));
        }

        return ListView.builder(
          itemBuilder:
              (context, index) => ProjectListTile(project: project[index]),
          itemCount: project.length,
        );
      },
    );

    var search = Padding(
      padding: EdgeInsets.all(8),
      child: SearchBar(
        elevation: WidgetStatePropertyAll(0),
        controller: _searchController,
        leading: const Icon(Icons.search),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
        hintText: 'Search',
        trailing: [
          IconButton(
            onPressed: () => _searchController.clear(),
            icon: Icon(Icons.close),
          ),
        ],
        onChanged: (value) async {
          if (value.isEmpty) {
            projectStream = db.where().watch(fireImmediately: true);
          }
          projectStream = db
              .where()
              .filter()
              .titleEqualTo(value)
              .watch(fireImmediately: true);
        },
      ),
    );

    return Column(children: [search, Expanded(child: Card(child: body))]);
  }
}
