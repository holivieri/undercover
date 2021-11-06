import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/default_images.dart';
import '../utils/text_style.dart';

class GenreCellWidget extends StatelessWidget {
  const GenreCellWidget({Key? key, this.backgroundImageUrl, this.title})
      : super(key: key);

  final String? backgroundImageUrl;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 90,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
                image: backgroundImageUrl == null
                    ? AssetImage(defaultSquareCardBackgroundUrl) as ImageProvider
                    : NetworkImage(backgroundImageUrl!)),
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
