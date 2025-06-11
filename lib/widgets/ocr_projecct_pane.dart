import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../api/database.dart';
import '../modules/ocr_project.dart';
import '../widgets/project_list_tile.dart';

class OcrProjectPane extends StatefulWidget {
  const OcrProjectPane({super.key});

  @override
  State<StatefulWidget> createState() => _OcrProjectPaneState();
}

class _OcrProjectPaneState extends State<OcrProjectPane> {
  late Isar _isar;
  TextEditingController _searchController = TextEditingController();
  late IsarCollection<OcrProject> _db;
  late Stream<List> _projectStream;

  @override
  void initState() {
    _isar = Database.isar;
    _db = _isar.ocrProjects;
    _projectStream = _db.where().watch(fireImmediately: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var body = StreamBuilder(
      stream: _projectStream,
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

        return Expanded(
          child: ListView.builder(
            itemBuilder:
                (context, index) => ProjectListTile(project: project[index]),
            itemCount: project.length,
          ),
        );
      },
    );

    var search = Padding(
      padding: EdgeInsets.all(10),
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
        onChanged: (value) {
          if (value.isEmpty) {
            setState(() {
              _projectStream = _db.where().watch(fireImmediately: true);
            });
          } else {
            setState(() {
              _projectStream = _db
                  .where()
                  .filter()
                  .titleContains(value)
                  .build()
                  .watch(fireImmediately: true);
            });
          }
        },
      ),
    );

    return Card(child: Column(children: [search, body]));
  }
}
