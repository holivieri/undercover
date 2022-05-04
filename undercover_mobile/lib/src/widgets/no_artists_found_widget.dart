import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class NoArtistsFoundMessage extends StatelessWidget {
  const NoArtistsFoundMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage('images/no-guitar.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(75)),
              boxShadow: [BoxShadow(blurRadius: 7)]),
        ),
        Text(S.of(context).noArtistsFound)
      ],
    );
  }
}
