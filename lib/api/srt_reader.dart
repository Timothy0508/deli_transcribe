import 'dart:io';

import '../modules/srt_entry.dart';

List<SrtEntry> parseSrtContentByFile(String path) {
  final file = File(path);
  final content = file.readAsStringSync();
  return parseSrtContent(content);
}

List<SrtEntry> parseSrtContent(String srtContent) {
  final List<SrtEntry> entries = [];
  String normalizedContent = srtContent.replaceAll('\r\n', '\n');

  final List<String> lines = normalizedContent.split('\n');
  List<String> currentBlockLines = [];

  for (int i = 0; i < lines.length; i++) {
    final String line = lines[i].trim();

    if (line.isNotEmpty && _isNumeric(line)) {
      if (currentBlockLines.isNotEmpty) {
        _processBlock(currentBlockLines, entries);
        currentBlockLines = [];
      }
      currentBlockLines.add(line);
    } else if (line.isNotEmpty ||
        (currentBlockLines.isNotEmpty && line.isEmpty)) {
      currentBlockLines.add(line);
    }
  }

  if (currentBlockLines.isNotEmpty) {
    _processBlock(currentBlockLines, entries);
  }

  return entries;
}

bool _isNumeric(String s) {
  if (s == null || s.isEmpty) {
    return false;
  }
  return int.tryParse(s) != null;
}

void _processBlock(List<String> blockLines, List<SrtEntry> entries) {
  final cleanedLines =
      blockLines.where((line) => line.trim().isNotEmpty).toList();

  if (cleanedLines.length < 2) {
    print('警告: 無效的 SRT 塊，行數不足或格式不正確，跳過此塊: $cleanedLines');
    return;
  }

  try {
    final int index = int.parse(cleanedLines[0].trim());
    final timeLine = cleanedLines[1].trim();
    final timeParts = timeLine.split(' --> ');

    if (timeParts.length != 2) {
      print('警告: 時間行格式不正確，跳過此塊: $timeLine');
      return;
    }

    final startTime = _parseSrtTime(timeParts[0]);
    final endTime = _parseSrtTime(timeParts[1]);

    // 文字內容從第三行開始
    // 確保在合併之前，對每一行文字進行 trim() 以移除前後空白
    final textLines = cleanedLines.sublist(2);
    final text = textLines.map((line) => line.trim()).join('\n');

    entries.add(
      SrtEntry(
        index: index,
        startTime: startTime,
        endTime: endTime,
        text: text,
      ),
    );
  } catch (e) {
    print('解析 SRT 塊時發生錯誤: $e\n塊內容:\n$blockLines');
  }
}

// 輔助函數：將 SRT 時間字串解析為 Duration 對象
Duration _parseSrtTime(String srtTime) {
  // 格式: HH:MM:SS,mmm
  final parts = srtTime.split(':');
  final hours = int.parse(parts[0]);

  // 分鐘和秒可能包含毫秒部分
  final minutesAndSeconds = parts[1].split(',');
  final minutes = int.parse(minutesAndSeconds[0]);

  final secondsAndMilliseconds = parts[2].split(',');
  final seconds = int.parse(secondsAndMilliseconds[0]);
  final milliseconds = int.parse(secondsAndMilliseconds[1]);

  return Duration(
    hours: hours,
    minutes: minutes,
    seconds: seconds,
    milliseconds: milliseconds,
  );
}

String _formatDurationToSrtTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String threeDigits(int n) => n.toString().padLeft(3, '0');

  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  final milliseconds = threeDigits(duration.inMilliseconds.remainder(1000));

  return '$hours:$minutes:$seconds,$milliseconds';
}

String convertSrtEntriesToText(List<SrtEntry> entries) {
  return entries.map((entry) => entry.text).join('\n');
}

String convertSrtEntriesToSrtFormat(List<SrtEntry> entries) {
  final StringBuffer srtBuffer = StringBuffer();

  for (int i = 0; i < entries.length; i++) {
    final entry = entries[i];
    srtBuffer.writeln(entry.index);
    srtBuffer.writeln(
      '${_formatDurationToSrtTime(entry.startTime)} --> ${_formatDurationToSrtTime(entry.endTime)}',
    );
    srtBuffer.writeln(entry.text);
    if (i < entries.length - 1) {
      srtBuffer.writeln('');
    }
  }
  return srtBuffer.toString();
}
