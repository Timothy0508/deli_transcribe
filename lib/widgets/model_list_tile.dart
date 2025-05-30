import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../api/hugging_face.dart';
import '../extensions/extensions.dart';

class ModelListTile extends StatefulWidget {
  final HuggingFaceModel model;

  const ModelListTile({super.key, required this.model});

  @override
  State<StatefulWidget> createState() => _ModelListTileState();
}

class _ModelListTileState extends State<ModelListTile> {
  double _progress = 0.0;
  bool _isDownloading = false;
  bool _fileExists = false;
  Dio _dio = Dio();

  Future<void> _checkFileExits() async {
    var dir = await getApplicationSupportDirectory();
    final file = File('${dir.path}/${widget.model.file}');
    setState(() {
      _fileExists = file.existsSync();
    });
  }

  void _showCheckDialog(String model, String action) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text('Are you sure to $action $model?'),
            title: Text('${action.capitalize()} $model'),
            actions: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                  _downloadOrDelete();
                },
                child: Text(action.capitalize()),
              ),
            ],
          ),
    );
  }

  void _downloadOrDelete() async {
    var dir = await getApplicationSupportDirectory();
    if (!_fileExists) {
      setState(() {
        _isDownloading = !_isDownloading;
        _progress = 0.0;
      });
      try {
        await _dio.download(
          widget.model.downloadUrl,
          '${dir.path}/${widget.model.file}',
          onReceiveProgress: (received, total) {
            setState(() {
              _progress = received / total;
            });
          },
        );
      } catch (e) {
        debugPrint(e.toString());
      }
      await _checkFileExits();
      setState(() {
        _isDownloading = !_isDownloading;
      });
    } else if (_fileExists) {
      try {
        var file = File('${dir.path}/${widget.model.file}');
        if (file.existsSync()) {
          await file.delete();
          _checkFileExits();
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checkFileExits();
  }

  @override
  Widget build(BuildContext context) {
    var title = Text(widget.model.title);
    var norTrailing =
        _fileExists
            ? Icon(Icons.check, color: Colors.green)
            : Icon(Icons.download, color: Colors.grey);
    var downloadTrailing = SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(value: _progress),
    );
    var trailing = _isDownloading ? downloadTrailing : norTrailing;

    return ListTile(
      title: title,
      trailing: trailing,
      onTap: () async {
        if (_fileExists) {
          _showCheckDialog(widget.model.title, 'delete');
        } else {
          _showCheckDialog(widget.model.title, 'download');
        }
      },
    );
  }
}
