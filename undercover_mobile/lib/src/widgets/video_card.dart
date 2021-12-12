import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/youtube_response_model.dart';
import '../utils/app_colors.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    required this.videoInfo,
    Key? key,
  }) : super(key: key);

  final Item videoInfo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(videoInfo.snippet.thumbnails.high.url),
          const Center(
            child: Icon(
              FontAwesomeIcons.youtube,
              color: youtubeColor,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
