import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Future<FilePickerResult?> showImportFileDialog(BuildContext context) async {
  return await showDialog<FilePickerResult>(
    context: context,
    builder: (context) => const ImportFileDialog(),
  );
}

class ImportFileDialog extends StatefulWidget {
  const ImportFileDialog({super.key});

  @override
  State<StatefulWidget> createState() => _ImportFileDialogState();
}

class _ImportFileDialogState extends State<ImportFileDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              var result = await FilePicker.platform.pickFiles(
                type: FileType.video,
              );
              if (context.mounted) Navigator.pop(context, result);
            },
            label: Text('Import Video'),
            icon: Icon(Icons.videocam),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              var result = await FilePicker.platform.pickFiles(
                type: FileType.audio,
              );
              if (context.mounted) Navigator.pop(context, result);
            },
            label: Text('Import Audio'),
            icon: Icon(Icons.audiotrack),
          ),
        ],
      ),
      actions: [
        OutlinedButton.icon(
          onPressed: () => Navigator.pop(context),
          label: Text('Close'),
          icon: Icon(Icons.close),
        ),
      ],
    );
  }
}
