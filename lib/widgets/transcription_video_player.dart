import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TranscriptionVideoPlayer extends StatefulWidget {
  final String videoPath;

  const TranscriptionVideoPlayer({super.key, required this.videoPath});

  @override
  State<StatefulWidget> createState() => _TranscriptionVideoPlayerState();
}

class _TranscriptionVideoPlayerState extends State<TranscriptionVideoPlayer> {
  late VideoPlayerController _playerController;
  bool _isPlaying = false;

  @override
  void initState() {
    _playerController = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var player =
        _playerController.value.isInitialized
            ? AspectRatio(
              aspectRatio: _playerController.value.aspectRatio,
              child: VideoPlayer(_playerController),
            )
            : Icon(Icons.videocam_off);

    var progress = LinearProgressIndicator(value: 0);

    var actions = IconButton(
      onPressed: () {
        if (_isPlaying) {
          _playerController.pause();
        } else {
          _playerController.play();
        }
        setState(() {
          _isPlaying = !_isPlaying;
        });
      },
      icon: _isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
    );

    var body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [player, progress, actions],
    );

    return Card(
      child: Container(padding: EdgeInsets.all(16), child: Center(child: body)),
    );
  }
}
