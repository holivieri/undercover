import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';
import '../utils/default_images.dart';
import '../utils/icons.dart';
import '../utils/text_style.dart';
import 'circle_avatar.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    this.title,
    this.backgroundImageUrl,
    this.profilePicture,
    this.profileInitials,
    Key? key,
  }) : super(key: key);

  final String? backgroundImageUrl;
  final String? profilePicture;
  final String? profileInitials;
  final String? title;

  @override
  Widget build(BuildContext context) {
    if (backgroundImageUrl == null) {
      return _returnEmptyCard(context);
    }

    return _returnStoryCard(context);
  }

  Widget _returnStoryCard(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 180,
          width: 100,
          decoration: const BoxDecoration(
            color: themeBoxBlue,
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: backgroundImageUrl == null
                        ? AssetImage(defaultTallCardBackgroundUrl)
                            as ImageProvider
                        : NetworkImage(backgroundImageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    title ?? '',
                    style: cardTitleSmallTextStyle,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatarWidget(
                    pictureUrl:
                        profilePicture ?? defaultSquareCardBackgroundUrl,
                    initials: profileInitials ?? '',
                    radiusSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _returnEmptyCard(BuildContext context) {
    //final Size screen = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 179,
        width: 101,
        decoration: const BoxDecoration(
          color: themeBoxBlueLightest,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 85,
              right: 5,
              child: RawMaterialButton(
                  padding: const EdgeInsets.all(15),
                  shape: const CircleBorder(),
                  onPressed: () {},
                  child: SvgPicture.asset(
                    '$iconsAssetsPath/plus-w.svg',
                    fit: BoxFit.cover,
                    color: themeBlue,
                  )),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'createStory',
                  style: cardTitleSmallTextStyle,
                ),
              ),
            ),
            Positioned(
              top: -30,
              child: CircleAvatarWidget(
                pictureUrl: profilePicture,
                initials: profileInitials,
                radiusSize: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
