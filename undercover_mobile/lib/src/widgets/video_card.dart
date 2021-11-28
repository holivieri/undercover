import 'package:flutter/material.dart';

import '../models/youtube_response_model.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    required this.videoInfo,
    Key? key,
  }) : super(key: key);

  final Item videoInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(videoInfo.snippet.title),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 400,
          height: 180,
          child: Image.network(videoInfo.snippet.thumbnails.high.url),
        ),
      ],
    );
  }
}
