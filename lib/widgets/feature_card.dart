import 'package:flutter/material.dart';

import '../routes/transcription_projects_page.dart';

enum AppFeatures {
  transcription(
    title: "Transcription",
    route: TranscriptionProjectsPage(),
    icon: Icon(Icons.transcribe),
  );

  final String title;

  final Widget route;

  final Icon icon;

  const AppFeatures({
    required this.title,
    required this.route,
    required this.icon,
  });
}

class FeatureCard extends StatefulWidget {
  final AppFeatures feature;

  const FeatureCard({super.key, required this.feature});

  @override
  State<StatefulWidget> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.feature.icon,
              Text(widget.feature.title, style: theme.textTheme.titleLarge),
            ],
          ),
        ),
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.feature.route),
            ),
      ),
    );
  }
}
