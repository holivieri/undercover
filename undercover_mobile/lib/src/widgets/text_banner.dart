import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/font.dart';

enum BannerType {
  error,
  success,
}

class TextBanner extends StatelessWidget {
  const TextBanner({
    required this.text,
    required this.bannerType,
    this.keyInput,
    this.prefixIconPath,
  });

  final String text;
  final BannerType bannerType;
  final Key? keyInput;
  final String? prefixIconPath;

  Color get _color {
    switch (bannerType) {
      case BannerType.error:
        return errorRed;
      case BannerType.success:
        return themeSuccess;
      default:
        throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      key: keyInput,
      color: _color,
      constraints: const BoxConstraints(minHeight: 48, maxHeight: 85),
      width: double.infinity,
      child: Wrap(
        children: [
          Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(minHeight: 5, maxHeight: 15),
          ),
          if (prefixIconPath != null)
            Image.asset(
              prefixIconPath!,
              height: 14,
              color: Colors.white,
            ),
          if (prefixIconPath != null) const SizedBox(width: 10),
          Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: mediumTextSize,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(
              minHeight: 5,
              maxHeight: 15,
            ),
          )
        ],
      ),
    );
  }
}
