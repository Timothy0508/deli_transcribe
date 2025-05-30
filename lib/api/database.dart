import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../modules/transcriptions.dart';

class Database {
  static late Isar isar;

  static Future<void> init() async {
    var dir = await getApplicationSupportDirectory();
    var path = '${dir.path}/database';
    await Directory(path).create(recursive: true);
    isar = await Isar.open(
      [TranscriptionsSchema],
      directory: path,
      inspector: true,
    );
  }
}
