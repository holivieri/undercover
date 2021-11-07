import 'package:flutter/material.dart';
import 'package:undercover_mobile/src/utils/font.dart';
import 'package:undercover_mobile/src/utils/text_style.dart';

Widget sectionHeader(String text, {bool isFirst = false, bool seeAll = true}) {
  return Column(children: [
    SizedBox(
      height: isFirst ? 0 : 19,
    ),
    Row(
      children: [
        Text(
          text,
          style: homeTitleTextStyle,
        ),
        const SizedBox(
          width: 8,
        ),
        InkWell(
          onTap: () {},
          child: seeAll
              ? Row(
                  children: const [
                    Text(
                      'seeAll',
                      style: seeAllTextStyle,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: fontColorBlue,
                      size: 15,
                    )
                  ],
                )
              : Container(),
        )
      ],
    ),
    const SizedBox(
      height: 19,
    )
  ]);
}
