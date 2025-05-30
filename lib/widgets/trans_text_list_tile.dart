import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import '../modules/srt_entry.dart';

class TransTextListTile extends StatefulWidget {
  final Duration time;

  final String text;

  const TransTextListTile({super.key, required this.time, required this.text});

  factory TransTextListTile.fromSrtEntry({required SrtEntry entry}) {
    return TransTextListTile(time: entry.startTime, text: entry.text);
  }

  @override
  State<StatefulWidget> createState() => _TransTextListTileState();
}

class _TransTextListTileState extends State<TransTextListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${widget.time.inHours}:${widget.time.inMinutes % 60}:${widget.time.inSeconds % 60}',
      ),
      title: Text(widget.text),
      onTap: () {
        FlutterClipboard.copy(widget.text);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Copied text to clipboard")),
        );
      },
    );
  }
}
