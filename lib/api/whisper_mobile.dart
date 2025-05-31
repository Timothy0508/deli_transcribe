import 'package:whisper_ggml/whisper_ggml.dart';

class WhisperMobile {
  Future<String> transcribe(String audioPath, WhisperModel model) async {
    final controller = WhisperController();
    final result = await controller.transcribe(
      model: model,
      audioPath: audioPath,
    );
    if (result == null) {
      throw Exception('Transcription failed');
    }
    return result.transcription.text;
  }

  void downloadModel(WhisperModel model) {
    final controller = WhisperController();
    controller.downloadModel(model);
  }
}
