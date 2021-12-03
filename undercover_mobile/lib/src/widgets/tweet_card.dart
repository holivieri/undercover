import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Container(
      width: 400,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Card(
        color: const Color.fromRGBO(0, 172, 238, 0.5),
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: const Icon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
            ),
            title: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
