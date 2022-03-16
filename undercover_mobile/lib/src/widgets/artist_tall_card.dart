import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../pages/artist_details_page.dart';
import '../utils/colors.dart';
import '../utils/default_images.dart';
import '../utils/text_style.dart';

class ArtistTallCard extends StatelessWidget {
  const ArtistTallCard({
    required this.artistId,
    required this.artistName,
    this.backgroundImageUrl,
    this.followersCount = 0,
    Key? key,
  }) : super(key: key);

  final String? backgroundImageUrl;
  final int? followersCount;
  final String? artistName;
  final String artistId;

  @override
  Widget build(BuildContext context) {
    return _returnArtistCard(context);
  }

  String checkPlurals(BuildContext context, int followers) {
    if (followers > 1) {
      return '$followers ${S.of(context).followers}';
    }
    return '$followers Seguidor';
  }

  Widget _returnArtistCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtistDetailsPage(
              artistId: artistId,
            ),
            settings: const RouteSettings(name: 'Artist Details'),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 220,
          width: 150,
          decoration: const BoxDecoration(
            color: themeBoxBlue,
          ),
          child: Stack(
            children: [
              Hero(
                tag: 'image-$artistId',
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          backgroundImageUrl ?? defaultSquareCardBackgroundUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 30),
                  child: Text(
                    artistName ?? '',
                    style: cardTitleTextBoldStyle,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    checkPlurals(context, followersCount!),
                    style: cardTitleSmallTextStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
