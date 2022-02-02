import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_style.dart';

class AreYouAnArtist extends StatelessWidget {
  const AreYouAnArtist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 220,
        width: 150,
        decoration: const BoxDecoration(
          color: themeBoxBlue,
        ),
        child: Stack(
          children: [
            Image.asset('assets/images/jazz.png'),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 30),
                child: Text(
                  'Artista del Under',
                  style: cardTitleTextBoldStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
