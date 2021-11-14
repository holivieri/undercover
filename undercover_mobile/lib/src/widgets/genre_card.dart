import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/default_images.dart';
import '../utils/text_style.dart';

class GenreCellWidget extends StatelessWidget {
  const GenreCellWidget({
    Key? key,
    this.backgroundImageUrl,
    this.title,
  }) : super(key: key);

  final String? backgroundImageUrl;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 90,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: title == 'Rock'
                  ? const AssetImage('images/rock-n-roll.jpg')
                  : title == 'Reggae'
                      ? const AssetImage('images/Reggae.jpg')
                      : title == 'Hip Hop'
                          ? const AssetImage('images/hiphop.jpg')
                          : title == 'Punk'
                              ? const AssetImage('images/punk.jpg')
                              : title == 'Blues'
                                  ? const AssetImage('images/blues.jpg')
                                  : title == 'Pop'
                                      ? const AssetImage('images/pop.jpg')
                                      : title == 'Jazz'
                                          ? const AssetImage('images/jazz.jpg')
                                          : title == 'Metal'
                                              ? const AssetImage(
                                                  'images/metal.jpg')
                                              : const AssetImage(
                                                  'images/jazz.png'),
              /* backgroundImageUrl == null
                  ? AssetImage(defaultSquareCardBackgroundUrl) as ImageProvider
                  : NetworkImage(backgroundImageUrl!), */
            ),
          ),
          child: Center(
            child: Text(
              title ?? '',
              style: cardTitleTextBoldStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
