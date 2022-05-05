import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/font.dart';

class NoArtistsFoundMessage extends StatelessWidget {
  const NoArtistsFoundMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(S.of(context).noArtistsFound, style: subtitleStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(S.of(context).goSearch, style: subtitleStyle),
        ),
      ],
    );
  }
}
