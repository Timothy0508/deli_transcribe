import 'dart:io';

import 'package:deli_transcribe/api/hugging_face.dart';
import 'package:deli_transcribe/api/srt_reader.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../api/database.dart';
import '../api/whisper.dart';
import '../modules/srt_entry.dart';
import '../modules/transcriptions.dart';
import '../widgets/import_file_dialog.dart';
import '../widgets/trans_text_list_tile.dart';

class TranscriptionPage extends StatefulWidget {
  final Transcriptions? project;

  const TranscriptionPage({super.key, this.project});

  @override
  State<StatefulWidget> createState() => _TranscriptionPageState();
}

enum DisplayMode { srt, text }

class _TranscriptionPageState extends State<TranscriptionPage> {
  var _body = <TransTextListTile>[];
  var _srtEntries = <SrtEntry>[];
  PlatformFile? _currentFile;
  DisplayMode _displayMode = DisplayMode.srt;
  bool _isTranscribing = false;
  List<HuggingFaceModel> _availableModels = [];
  HuggingFaceModel? _selectedModel;

  void init() async {
    var models = await _getAvailableModels();
    setState(() {
      _availableModels = models;
    });
  }

  bool? _isVideo(String? extension) {
    if (extension == 'avi' ||
        extension == 'flv' ||
        extension == 'mkv' ||
        extension == 'mov' ||
        extension == 'mp4' ||
        extension == 'mpeg' ||
        extension == 'webm' ||
        extension == 'wmv') {
      return true;
    } else if (extension == null) {
      return null;
    } else {
      return false;
    }
  }

  void _transcription(HuggingFaceModel? model) async {
    setState(() {
      _isTranscribing = true;
    });

    try {
      if (model == null) {
        throw Exception('No model selected');
      }
      var dir = await getApplicationSupportDirectory();
      _body.clear();
      _srtEntries.clear();
      var whisper = Whisper();
      var path = widget.project?.filePath ?? _currentFile?.path;
      if (path == null) return;
      var result = await whisper.transcribe(path, '${dir.path}/${model.file}');
      _srtEntries = result;
      setState(() {
        _body = List.generate(
          result.length,
          (index) => TransTextListTile.fromSrtEntry(entry: result[index]),
        );
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        _isTranscribing = false;
      });
    }
  }

  Future<List<HuggingFaceModel>> _getAvailableModels() async {
    var dir = await getApplicationSupportDirectory();
    var models = HuggingFaceModel.values;
    var availableModels = <HuggingFaceModel>[];
    for (var model in models) {
      if (File('${dir.path}/${model.file}').existsSync()) {
        availableModels.add(model);
      }
    }
    return availableModels;
  }

  void _showModelUnselectDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('No model selected'),
            content: Text('Please select a model first.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  VoidCallback? _transcribeButtonAction() {
    if (_currentFile == null && widget.project?.filePath == null) {
      return null;
    } else if (_selectedModel == null) {
      return () => _showModelUnselectDialog();
    } else if (_isTranscribing) {
      return null;
    } else {
      return () => _transcription(_selectedModel);
    }
  }

  @override
  void initState() {
    setState(() {
      init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.project?.transcription != null) {
      setState(() {
        _srtEntries = parseSrtContent(widget.project?.transcription! ?? '');
        _body = List.generate(
          _srtEntries.length,
          (index) => TransTextListTile.fromSrtEntry(entry: _srtEntries[index]),
        );
      });
    }

    var title =
        widget.project?.title ?? _currentFile?.name ?? 'No file selected';
    var displayModeButton = SegmentedButton(
      segments: [
        ButtonSegment(
          value: DisplayMode.srt,
          icon: Icon(Icons.subtitles),
          label: Text('SRT'),
        ),
        ButtonSegment(
          value: DisplayMode.text,
          icon: Icon(Icons.text_fields),
          label: Text('Text'),
        ),
      ],
      selected: {_displayMode},
      onSelectionChanged: (value) {
        setState(() {
          _displayMode = value.first;
        });
      },
    );
    var srtBody = SliverList.separated(
      itemBuilder: (context, index) => _body[index],
      itemCount: _body.length,
      separatorBuilder: (context, index) => const Divider(),
    );
    var textBody = SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20),
        child: SelectableText(convertSrtEntriesToText(_srtEntries)),
      ),
    );
    var resultBody = _displayMode == DisplayMode.srt ? srtBody : textBody;
    var processingBody = SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            Text('Processing...'),
            SizedBox(width: 200, child: LinearProgressIndicator()),
          ],
        ),
      ),
    );
    var clearButton = ElevatedButton.icon(
      onPressed: () {
        setState(() {
          _srtEntries.clear();
          _body.clear();
        });
      },
      label: Text('Clear'),
      icon: Icon(Icons.delete),
    );
    var tools = SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [clearButton, displayModeButton],
        ),
      ),
    );
    var body = _isTranscribing ? processingBody : resultBody;
    var modelSelector = DropdownMenu(
      label: Text('Choose a model'),
      width: 200,
      dropdownMenuEntries: List.generate(
        _availableModels.length,
        (index) => DropdownMenuEntry(
          value: _availableModels[index],
          label: _availableModels[index].title,
        ),
      ),
      onSelected: (model) {
        if (model != null) {
          setState(() {
            _selectedModel = model;
          });
        }
      },
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () async {
                  var isar = Database.isar;
                  await isar.writeTxn(() async {
                    var transcription = widget.project ?? Transcriptions();
                    transcription.title =
                        widget.project?.title ?? _currentFile?.name;
                    transcription.filePath =
                        widget.project?.title ?? _currentFile?.path;
                    transcription.transcription = convertSrtEntriesToSrtFormat(
                      _srtEntries,
                    );
                    transcription.isVideo = _isVideo(
                      _currentFile?.extension ??
                          widget.project?.filePath?.split('.').last,
                    );
                    await isar.transcriptions.put(transcription);
                  });
                },
                icon: Icon(Icons.save),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                spacing: _currentFile != null ? 10 : 0,
                children: [
                  _isVideo(
                            _currentFile?.extension ??
                                widget.project?.filePath?.split('.').last,
                          ) ==
                          true
                      ? Icon(Icons.videocam)
                      : _isVideo(
                            _currentFile?.extension ??
                                widget.project?.filePath?.split('.').last,
                          ) ==
                          false
                      ? Icon(Icons.audiotrack)
                      : SizedBox(),
                  Text(title, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            expandedHeight: 200,
            pinned: true,
          ),
          tools,
          body,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await showImportFileDialog(context);
          if (result == null) return;
          setState(() {
            _currentFile = result.files.first;
          });
        },
        child: Icon(Icons.attach_file),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            modelSelector,
            ElevatedButton.icon(
              onPressed:
                  _srtEntries.isEmpty
                      ? null
                      : () async {
                        var initDir = await getApplicationDocumentsDirectory();
                        var result = await FilePicker.platform.saveFile(
                          fileName: '${_currentFile?.name.split('.')[0]}.srt',
                          initialDirectory: initDir.path,
                          type: FileType.custom,
                          allowedExtensions: ['srt'],
                        );
                        if (result == null) return; //Safety check.
                        var filePath = File(result);
                        await filePath.writeAsString(
                          convertSrtEntriesToSrtFormat(_srtEntries),
                        );
                      },
              label: Text('Export SRT'),
              icon: Icon(Icons.file_upload_outlined),
            ),
            ElevatedButton.icon(
              onPressed: _transcribeButtonAction(),
              label: Text('Transcribe'),
              icon: Icon(Icons.transcribe),
            ),
          ],
        ),
      ),
    );
  }
}
