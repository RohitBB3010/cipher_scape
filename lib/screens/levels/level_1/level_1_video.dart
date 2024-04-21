import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/screens/home/level.dart';
import 'package:cipher_affair/screens/levels/level_1/level_1_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Level1Video extends StatefulWidget {
  final Level currentLevel;
  const Level1Video({super.key, required this.currentLevel});

  @override
  State<Level1Video> createState() => _Level1VideoState();
}

class _Level1VideoState extends State<Level1Video> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/level_1_video.mp4')
          ..initialize().then((_) {
            setState(() {});
          });
    _videoPlayerController.value.isPlaying;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_3,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Level1Page()));
              },
              child: AutoSizeText('Start'))
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        title: AutoSizeText(
          widget.currentLevel.title,
          maxLines: 1,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Kod',
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ),
      body: Center(
        child: _videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _videoPlayerController.value.isPlaying
                ? _videoPlayerController.pause()
                : _videoPlayerController.play();
          });
        },
        child: _videoPlayerController.value.isPlaying
            ? const Icon(Icons.pause)
            : const Icon(Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
