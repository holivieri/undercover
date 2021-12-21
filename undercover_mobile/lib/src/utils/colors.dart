import 'package:flutter/material.dart';

const themeBlue = Color.fromRGBO(0, 76, 186, 1); // Hex 004cba
const themeMediumDarkGrey = Color.fromRGBO(136, 136, 136, 1);

///This color should only be used in the blue gradient
const themeLightBlue = Color.fromRGBO(2, 0, 52, 1);

///This color should only be used in the blue gradient
const themeDarkBlue = Color.fromRGBO(1, 0, 25, 1);

//boxes
const themeBoxBlue = Color.fromRGBO(0, 55, 100, 1); // Hex 003764
const themeBoxBlueLight = Color.fromRGBO(0, 55, 100, 0.15);
const themeBoxBlueLighter = Color.fromRGBO(0, 55, 100, 0.3);
const themeBoxBlueLightest = Color.fromRGBO(0, 55, 100, 0.5);

//Highlitght colors
const themeHighlightGreen = Color.fromRGBO(0, 255, 255, 1);
const themeHighlightBlue = Color.fromRGBO(0, 0, 255, 1);

//Alert message
const themeSuccess = themeHighlightGreen;
const themeDanger = Color.fromRGBO(216, 2, 66, 1);

const highlightGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    themeHighlightGreen,
    themeHighlightBlue,
  ],
);

//background
const gradientColor1 = themeDarkBlue;
const gradientColor2 = themeLightBlue;

const themeBackgroundGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    gradientColor1,
    gradientColor2,
  ],
);

//////////////////
const errorRed = Color.fromRGBO(216, 2, 66, 1);
const themeRed = Color.fromRGBO(229, 0, 0, 1);

final Color whiteOpacity = Colors.white.withOpacity(0.3);

const disabledColorLightenedAmount = .25;

///Darkens a given color by the specified amount
Color darken({
  required Color color,
  required double amountToDarken,
}) {
  assert(
    amountToDarken > 0 && amountToDarken <= 1,
    'amountToDarken value is not valid',
  );

  final hslColor = HSLColor.fromColor(color);
  final hslColorDarkened = hslColor.withLightness(
    (hslColor.lightness - amountToDarken).clamp(0.0, 1.0),
  );

  return hslColorDarkened.toColor();
}

///Lightens a given color by the specified amount
Color lighten({
  required Color color,
  required double amountToLighten,
}) {
  assert(
    amountToLighten > 0 && amountToLighten <= 1,
    'amountToLighten value is not valid',
  );

  final hslColor = HSLColor.fromColor(color);
  final hslColorLightened = hslColor.withLightness(
    (hslColor.lightness + amountToLighten).clamp(0.0, 1.0),
  );

  return hslColorLightened.toColor();
}
