import 'package:isar/isar.dart';

part 'ocr_project.g.dart';

@collection
class OcrProject {
  Id id = Isar.autoIncrement;

  @Name('Title')
  String? title;

  @Name('Image Path')
  String? imagePath;

  @Name('Result')
  String? result;
}
