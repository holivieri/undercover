import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AreYouAnArtist extends StatelessWidget {
  const AreYouAnArtist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 220,
        width: 400,
        decoration: const BoxDecoration(
          color: themeBoxBlue,
        ),
        child: Image.asset('assets/images/jazz.png'),
      ),
    );
  }
}
