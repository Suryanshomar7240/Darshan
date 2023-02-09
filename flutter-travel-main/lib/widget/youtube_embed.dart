// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:travel_app/theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeEmbed extends StatelessWidget {
  final String videoID;
  late YoutubePlayerController controller;
  YoutubeEmbed({Key? key, required this.videoID}) {
    this.controller = YoutubePlayerController(
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
      initialVideoId: videoID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: YoutubePlayer(
        controller: controller,
        liveUIColor: kOrangeColor,
        showVideoProgressIndicator: false,
      ),
    );
  }
}
