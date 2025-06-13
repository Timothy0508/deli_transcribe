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
  Duration? _duration;
  Duration? _position;

  @override
  void initState() {
    _player.setSourceDeviceFile(widget.audioPath);
    _player.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });
    _player.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });
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
    var positionProgress =
        _duration == null || _position == null || _duration == Duration.zero
            ? LinearProgressIndicator()
            : LinearProgressIndicator(
              value: _position!.inSeconds / _duration!.inSeconds,
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
                      _player.setSourceDeviceFile(widget.audioPath);
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
