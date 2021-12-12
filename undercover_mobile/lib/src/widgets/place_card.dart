import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';
import '../utils/default_images.dart';
import '../utils/text_style.dart';

enum RoundedRectangleCardType {
  largeVideo,
  wide,
}

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    required this.placeId,
    this.title,
    this.subtitle,
    this.rightSubtitle = '',
    this.rightTitle = '',
    this.backgroundImageUrl,
    this.cardType = RoundedRectangleCardType.wide,
    this.widthInfinit = false,
    Key? key,
  }) : super(key: key);

  final String? backgroundImageUrl;
  final String? subtitle;
  final String? title;
  final String? rightTitle;
  final String? rightSubtitle;
  final RoundedRectangleCardType cardType;
  final bool widthInfinit;
  final String placeId;

  @override
  Widget build(BuildContext context) {
    return _returnRoundedRectangleCard(context);
  }

  Widget _returnRoundedRectangleCard(BuildContext context) {
    double _cardWidth = 320;
    double _cardHeight = 190;
    double _imageWidth = _cardWidth;
    double _imageHeight = 150;

    switch (cardType) {
      case RoundedRectangleCardType.largeVideo:
        _cardWidth = 317;
        _cardHeight = 215;
        _imageHeight = 176;
        _imageWidth = _cardWidth;
        break;
      default:
        break;
    }

    return InkWell(
      onTap: () {
        Get.toNamed(placeRoute, arguments: placeId);
      },
      child: Container(
        height: _cardHeight,
        width: widthInfinit ? 350 : _cardWidth,
        child: Stack(
          children: [
            Container(
              width: widthInfinit ? null : _imageWidth,
              height: _imageHeight,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: _imageHeight,
                      width: widthInfinit ? null : _imageWidth,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(backgroundImageUrl ??
                              defaultWideCardBackgroundUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(child: Builder(builder: (context) {
                    final condition =
                        cardType == RoundedRectangleCardType.largeVideo;
                    if (condition) {
                      return Image.asset(
                        'assets/images/common/video_play_overlay.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                      );
                    } else {
                      return const Text('');
                    }
                  })),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 18),
                child: Text(
                  title ?? '',
                  style: cardTitleTextStyle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  subtitle ?? '',
                  style: cardTitleGrayTextStyle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 18),
                child: Text(
                  rightTitle ?? '',
                  style: cardTitleTextStyle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  rightSubtitle ?? '',
                  style: cardTitleGrayTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
