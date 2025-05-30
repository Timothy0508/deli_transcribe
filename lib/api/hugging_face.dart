import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

enum HuggingFaceModel {
  base(file: "ggml-base.bin", title: "Base"),
  large(file: "ggml-large-v3.bin", title: "Large"),
  medium(file: "ggml-medium.bin", title: "Medium"),
  small(file: "ggml-small.bin", title: "Small"),
  tiny(file: "ggml-tiny.bin", title: "Tiny"),
  baseEn(file: "ggml-base.en.bin", title: "Base English"),
  largeEn(file: "ggml-large-v3.en.bin", title: "Large English"),
  mediumEn(file: "ggml-medium.en.bin", title: "Medium English"),
  smallEn(file: "ggml-small.en.bin", title: "Small English"),
  tinyEn(file: "ggml-tiny.en.bin", title: "Tiny English");

  final String file;

  final String title;
  String get downloadUrl =>
      'https://huggingface.co/ggerganov/whisper.cpp/resolve/main/$file?download=true';

  const HuggingFaceModel({required this.file, required this.title});
}

///This is the api to interact with hugging face.
///Notice that this is only for downloading model but not using model from hugging face directly.
class HuggingFaceApi {
  Future<String> get modelDirPath async {
    var dir = await getApplicationSupportDirectory();
    return dir.path;
  }

  Future<File> downloadModel(
    HuggingFaceModel model,
    ProgressCallback onReceiveProgress,
  ) async {
    Dio dio = Dio();
    var dirPath = await modelDirPath;
    var response = await dio.download(
      model.downloadUrl,
      '$dirPath/${model.file}',
      onReceiveProgress: onReceiveProgress,
    );
    if (response.statusCode == 200) {
      return File('$dirPath/${model.file}');
    } else {
      throw Exception('Failed to download model');
    }
  }

  Future<Map<HuggingFaceModel, bool>> checkModelExists() async {
    Map<HuggingFaceModel, bool> result = {};
    var dirPath = await modelDirPath;
    for (var model in HuggingFaceModel.values) {
      result[model] = File('$dirPath/${model.file}').existsSync();
    }
    return result;
  }
}
