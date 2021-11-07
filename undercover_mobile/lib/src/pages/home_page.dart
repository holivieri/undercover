import 'package:flutter/material.dart';
import 'package:undercover_mobile/src/utils/colors.dart';
import 'package:undercover_mobile/src/widgets/undercover_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UnderAppbar(),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: themeBackgroundGradient),
        child: const Text('Hola Mundo'),
      ),
    );
  }
}

Widget mainBody() {
  return Column(
    children: [
      getMyBands(),
    ],
  );
}

Widget getMyBands() {
  return Row(
    children: const [],
  );
}
