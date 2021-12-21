import 'package:flutter/material.dart';

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
                  ? const AssetImage('assets/images/rock-n-roll.jpg')
                  : title == 'Reggae'
                      ? const AssetImage('assets/images/Reggae.jpg')
                      : title == 'Hip Hop'
                          ? const AssetImage('assets/images/hiphop.jpg')
                          : title == 'Punk'
                              ? const AssetImage('assets/images/punk.jpg')
                              : title == 'Blues'
                                  ? const AssetImage('assets/images/blues.jpg')
                                  : title == 'Pop'
                                      ? const AssetImage(
                                          'assets/images/pop.jpg')
                                      : title == 'Jazz'
                                          ? const AssetImage(
                                              'assets/images/jazz.jpg')
                                          : title == 'Metal'
                                              ? const AssetImage(
                                                  'assets/images/metal.jpg')
                                              : const AssetImage(
                                                  'assets/images/jazz.png'),
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
