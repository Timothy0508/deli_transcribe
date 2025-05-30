import 'package:isar/isar.dart';

part 'transcriptions.g.dart';

@collection
class Transcriptions {
  Id id = Isar.autoIncrement;

  @Name('Title')
  String? title;

  @Name('File Path')
  String? filePath;

  @Name('Transcription')
  String? transcription;

  @Name('Is Video')
  bool? isVideo;
}
