import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/colors.dart';

class TweetCard extends StatelessWidget {
  const TweetCard({
    required this.message,
    required this.createdDate,
    required this.likeCount,
    required this.retweetCount,
    required this.replyCount,
    Key? key,
  }) : super(key: key);

  final String message;
  final DateTime createdDate;
  final int likeCount;
  final int retweetCount;
  final int replyCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: themeBoxBlue,
      elevation: 20,
      child: ListTile(
        leading: const Icon(
          FontAwesomeIcons.twitter,
          color: Colors.white,
        ),
        subtitle: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
