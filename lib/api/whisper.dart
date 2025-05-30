import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:whisper4dart/whisper4dart.dart' as whisper;

import '../modules/srt_entry.dart';
import 'srt_reader.dart';

class Whisper {
  Future<Directory> get tempDir async {
    var dir = await getTemporaryDirectory();
    return dir;
  }

  Future<List<SrtEntry>> transcribe(String path, String? modelPath) async {
    final logPath = '${(await tempDir).path}/log.txt';
    var params = whisper.createContextDefaultParams();
    var model = modelPath.toString();
    var whisperModel = whisper.Whisper(model, params, outputMode: "srt");

    String output = await whisperModel.inferIsolate(
      path,
      logPath: logPath,
      numProcessors: 1,
      startTime: 0,
      endTime: -1,
      useOriginalTime: true,
    );

    return parseSrtContent(output);
  }
}
