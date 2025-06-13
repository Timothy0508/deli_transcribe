import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart ';

class TranscriptionAudioPlayer extends StatefulWidget {
  final String audioPath;

  const TranscriptionAudioPlayer({super.key, required this.audioPath});

  @override
  State<StatefulWidget> createState() => _TranscriptionAudioPlayerState();
}

class _TranscriptionAudioPlayerState extends State<TranscriptionAudioPlayer> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    _player.setSourceDeviceFile(widget.audioPath);
    super.initState();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var positionProgress = StreamBuilder(
      stream: _player.onDurationChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var duration = snapshot.data!;
          return StreamBuilder(
            stream: _player.onPositionChanged,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return LinearProgressIndicator(
                  value: 1.0,
                  color: theme.colorScheme.error,
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return LinearProgressIndicator(value: 0);
              }

              var position = snapshot.data;
              if (position == null) {
                return LinearProgressIndicator(value: 0);
              } else {
                return LinearProgressIndicator(
                  value: position.inSeconds / duration.inSeconds,
                );
              }
            },
          );
        } else {
          return LinearProgressIndicator();
        }
      },
    );
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.graphic_eq, size: 56),
            positionProgress,
            IconButton(
              onPressed: () {
                _player.state == PlayerState.completed
                    ? setState(() {
                      _player.stop();
                    })
                    : _player.resume();
              },
              icon:
                  _player.state == PlayerState.completed
                      ? Icon(Icons.restart_alt)
                      : Icon(Icons.play_arrow),
            ),
          ],
        ),
      ),
    );
  }
}
