import 'package:flutter/material.dart';

import '../routes/ocr_page.dart';
import '../routes/transcription_page.dart';

enum AppFeatures {
  transcription(
    title: "Transcription",
    route: TranscriptionPage(),
    icon: Icon(Icons.transcribe),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF669B2A), Color(0xFF53C1ED)],
    ),
  ),
  ocr(
    title: "OCR",
    route: OcrPage(),
    icon: Icon(Icons.text_fields),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFDD61FF), Color(0xFF4FA7FF)],
    ),
  );

  final String title;

  final Widget route;

  final Icon icon;

  final Gradient? gradient;

  const AppFeatures({
    required this.title,
    required this.route,
    required this.icon,
    this.gradient,
  });
}

class FeatureCard extends StatefulWidget {
  final AppFeatures feature;

  final VoidCallback onPressed;

  const FeatureCard({
    super.key,
    required this.feature,
    required this.onPressed,
  });

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
        onTap: widget.onPressed,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: widget.feature.gradient,
          ),
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
      ),
    );
  }
}
