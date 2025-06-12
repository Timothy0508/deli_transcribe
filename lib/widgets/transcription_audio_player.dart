import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart ';

class TranscriptionAudioPlayer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TranscriptionAudioPlayerState();
}

class _TranscriptionAudioPlayerState extends State<TranscriptionAudioPlayer> {
  double _position = 0;
  AudioPlayer _player = AudioPlayer();
  late Duration _duration;

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  void initPlayer() async {
    _duration = (await _player.getDuration())!;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var positionProgress = StreamBuilder(
      stream: _player.onPositionChanged,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return LinearProgressIndicator(
            value: 1.0,
            color: theme.colorScheme.error,
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator();
        }

        var position = snapshot.data;
        if (position == null) {
          return LinearProgressIndicator();
        } else {
          return LinearProgressIndicator(
            value: position.inSeconds / _duration.inSeconds,
          );
        }
      },
    );
    return Card(child: Column(children: [positionProgress]));
  }
}
