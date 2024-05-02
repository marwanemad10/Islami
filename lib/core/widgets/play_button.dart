import 'package:flutter/material.dart';
import 'package:islami_c10_str/core/providers/audio_player_provider.dart';
import 'package:provider/provider.dart';

class PlayButton extends StatefulWidget {
  final int index;
  final String url;

  const PlayButton({
    super.key,
    required this.index,
    required this.url,
  });

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  @override
  Widget build(BuildContext context) {
    var playerProvider = context.watch<AudioPlayerProvider>();

    return IconButton(
      icon: (() {
        if (playerProvider.index == widget.index &&
            playerProvider.isPlaying &&
            playerProvider.url == widget.url) {
          return const Icon(
            Icons.pause,
          );
        } else {
          return const Icon(
            Icons.play_arrow,
          );
        }
      })(),
      onPressed: () {
        if (playerProvider.isPlaying) {
          if (playerProvider.url == widget.url) {
            playerProvider.stopAudio();
          } else {
            playerProvider.isPlaying = false;
            playerProvider.index = widget.index;
            playerProvider.playAudio(widget.url);
          }
        } else {
          playerProvider.index = widget.index;
          playerProvider.playAudio(widget.url);
        }
      },
    );
  }
}
