import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'api/database.dart';
import 'routes/transcription_projects_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Transcribe',
      theme: FlexThemeData.light(scheme: FlexScheme.greenM3),
      home: const TranscriptionProjectsPage(),
    );
  }
}
