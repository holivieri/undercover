import 'package:flutter/material.dart';
import 'package:undercover_mobile/src/widgets/are_you_a_bar_owner_widget.dart';

import '../widgets/are_you_an_artist_widget.dart';

class WizardProfile extends StatefulWidget {
  const WizardProfile({Key? key}) : super(key: key);

  @override
  State<WizardProfile> createState() => _WizardProfileState();
}

class _WizardProfileState extends State<WizardProfile> {
  static const _steps = [
    Step(
      title: Text('¿Sos músico o artista?'),
      content: AreYouAnArtist(),
    ),
    Step(
      title: Text('¿Tienes un bar y queres invitar músicos a tocar?'),
      content: AreYouABarOwner(),
    ),
    Step(
      title: Text('Completa tu información'),
      content: AreYouABarOwner(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
