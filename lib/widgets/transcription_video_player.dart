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

    return Card(child: Center(child: player));
  }
}
