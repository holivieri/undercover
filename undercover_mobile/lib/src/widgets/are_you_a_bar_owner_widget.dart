import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AreYouABarOwner extends StatelessWidget {
  const AreYouABarOwner({Key? key}) : super(key: key);

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
        child: Stack(
          children: [
            Image.asset('assets/images/bar.jpg'),
          ],
        ),
      ),
    );
  }
}
