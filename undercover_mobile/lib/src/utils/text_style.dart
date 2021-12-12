import 'dart:ui';

import 'package:flutter/material.dart';

import 'font.dart';
import 'shadow.dart';

const TextStyle cardTitleTextBoldStyle = TextStyle(
  color: fontColorWhite,
  fontSize: 16,
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.bold,
  shadows: <Shadow>[normalTextShadow],
);

const TextStyle cardTitleTextStyle = TextStyle(
  color: fontColorWhite,
  fontSize: 16,
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w500,
  shadows: <Shadow>[normalTextShadow],
);

const TextStyle cardTitleGrayTextStyle = TextStyle(
  color: fontColorGrey,
  fontSize: 14,
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w500,
  shadows: <Shadow>[normalTextShadow],
);

const TextStyle cardTitleSmallTextStyle = TextStyle(
  color: fontColorWhite,
  fontSize: 12,
  fontFamily: 'Ubuntu',
  shadows: <Shadow>[normalTextShadow],
);

const TextStyle userNameTextStyle = TextStyle(
  color: fontColorWhite,
  fontSize: 14,
  fontFamily: 'Ubuntu',
  shadows: <Shadow>[normalTextShadow],
);

const TextStyle homeTitleTextStyle = TextStyle(
  color: fontColorWhite,
  fontSize: 18,
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.bold,
  shadows: <Shadow>[normalTextShadow],
);

const TextStyle seeAllTextStyle = TextStyle(
  color: fontColorBlue,
  fontSize: 14,
  fontFamily: 'Ubuntu',
  shadows: <Shadow>[normalTextShadow],
);
