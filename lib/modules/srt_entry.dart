class SrtEntry {
  final int index;
  final Duration startTime;
  final Duration endTime;
  final String text;

  SrtEntry({
    required this.index,
    required this.startTime,
    required this.endTime,
    required this.text,
  });

  @override
  String toString() {
    return 'Index: $index, Start Time: ${startTime.inMilliseconds}ms, End Time: ${endTime.inMilliseconds}ms, Text: "$text"';
  }
}
