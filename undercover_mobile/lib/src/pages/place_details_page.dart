import 'package:flutter/material.dart';

import '../utils/colors.dart';

class PlaceDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: themeBackgroundGradient),
        child: mainBody(),
      ),
    );
  }

  Widget mainBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 300,
            height: 300,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
