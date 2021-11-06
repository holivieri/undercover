import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/colors.dart';
import '../utils/default_images.dart';
import '../utils/font.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    required this.radiusSize,
    Key? key,
    this.pictureUrl,
    this.initials,
  }) : super(key: key);
  final String? pictureUrl;
  final String? initials;
  final double radiusSize;

  @override
  Widget build(BuildContext context) {
    const TextStyle nameStyle = TextStyle(fontSize: h2FontSize);

    if (pictureUrl != null) {
      return addBlueBorder(
        child: CircleAvatar(
            radius: radiusSize,
            backgroundImage: pictureUrl == null
                ? AssetImage(defaultSquareCardBackgroundUrl) as ImageProvider
                : NetworkImage(pictureUrl!)),
      );
    }
    if (initials != null) {
      return addBlueBorder(
        child: CircleAvatar(
          backgroundColor: themeBoxBlueLight,
          radius: radiusSize,
          child: Text(
            initials?.toUpperCase() ?? '',
            style: nameStyle,
          ),
        ),
      );
    }
    //both are null
    return addBlueBorder(
      child: CircleAvatar(
        backgroundColor: themeBoxBlueLight,
        radius: radiusSize,
        child: const Icon(
          FontAwesomeIcons.user,
        ),
      ),
    );
  }

  Widget addBlueBorder({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: themeBlue,
          width: 2,
        ),
      ),
      child: child,
    );
  }
}
