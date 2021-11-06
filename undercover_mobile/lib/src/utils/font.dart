import 'package:flutter/material.dart';

import 'colors.dart';

const double hugeTextSize = 24;
const double largeTextSize = 16;
const double mediumTextSize = 14;
const double smallTextSize = 12;
const double semiTinyTextSize = 11;
const double tinyTextSize = 10;

const double h1FontSize = 30;
const double h2FontSize = 20;
const double h3FontSize = 18;

const double fieldTextFontSize = largeTextSize;
const double maxFieldTextFontSize = h3FontSize;
const double fieldHintTextFontSize = largeTextSize;

const double buttonTextFontSize = largeTextSize - 2.2;
const double maxButtonTextFontSize = h3FontSize;

const fontColorWhite = Colors.white;
const fontColorGrey = themeMediumDarkGrey;
const fontColorBlue = themeBlue;

const bool allowFontScaling = true;

const String fontFamily = 'ubuntu';

const TextStyle titleStyle = TextStyle(
  fontSize: largeTextSize,
  color: Colors.white,
);

const TextStyle seeAllStyle = TextStyle(
  fontSize: mediumTextSize,
  color: themeBlue,
);

const TextStyle mediumWhiteStyle = TextStyle(
  fontSize: mediumTextSize,
  color: Colors.white,
);

const TextStyle h1WhiteStyle = TextStyle(
  fontSize: h1FontSize,
  color: Colors.white,
);

const TextStyle h3WhiteStyle = TextStyle(
  fontSize: h3FontSize,
  color: Colors.white,
);

const TextStyle subtitleStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontFamily: 'Ubuntu',
);

final TextStyle paragraphStyle = TextStyle(
  fontSize: mediumTextSize,
  color: Colors.white.withOpacity(0.5),
  fontFamily: 'Ubuntu',
);

const TextStyle newsTitleStyle = TextStyle(
  fontSize: mediumTextSize,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Ubuntu',
);

const TextStyle selectedLabelStyle = TextStyle(
  fontSize: smallTextSize,
  color: themeBlue,
  fontWeight: FontWeight.normal,
  fontFamily: 'Ubuntu',
);

const TextStyle unselectedLabelStyle = TextStyle(
  fontSize: smallTextSize,
  color: themeMediumDarkGrey,
  fontWeight: FontWeight.normal,
  fontFamily: 'Ubuntu',
);
