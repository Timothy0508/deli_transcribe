import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../api/database.dart';
import '../modules/transcriptions.dart';
import '../widgets/project_list_tile.dart';
import 'model_manage_page.dart';
import 'transcription_page.dart';

class TranscriptionProjectsPage extends StatefulWidget {
  const TranscriptionProjectsPage({super.key});

  @override
  State<StatefulWidget> createState() => _TranscriptionProjectsPageState();
}

class _TranscriptionProjectsPageState extends State<TranscriptionProjectsPage> {
  late Isar _isar;

  @override
  void initState() {
    super.initState();
    _isar = Database.isar;
  }

  @override
  Widget build(BuildContext context) {
    var db = _isar.transcriptions;
    var projectsStream = db.where().watch(fireImmediately: true);
    var projectsBody = StreamBuilder(
      stream: projectsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Error: ${snapshot.error}')),
          );
        }

        final projects = snapshot.data;

        if (projects == null || projects.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text('No transcription projects found.'),
              ),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: projects.length,
            (context, index) => ProjectListTile(project: projects[index]),
          ),
        );
      },
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Transcription Projects'),

              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF669B2A), Color(0xFF53C1ED)],
                  ),
                ),
              ),
            ),
            actions: [
              ElevatedButton.icon(
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ModelManagePage(),
                      ),
                    ),
                label: Text('Manage models'),
                icon: Icon(Icons.settings),
              ),
              SizedBox(width: 10),
            ],
          ),
          projectsBody,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TranscriptionPage()),
            ),
        child: Icon(Icons.add),
      ),
    );
  }
}
