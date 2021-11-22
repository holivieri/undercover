import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../routes/routes.dart';

class UnderAppbar extends StatefulWidget implements PreferredSizeWidget {
  const UnderAppbar({Key? key})
      // ignore: avoid_field_initializers_in_const_classes
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _UnderAppbarState createState() => _UnderAppbarState();
}

class _UnderAppbarState extends State<UnderAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: getIcons(),
    );
  }

  Widget getIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(
          Icons.circle_notifications,
          color: Colors.white,
          size: 40,
        ),
        const Icon(
          FontAwesomeIcons.guitar,
          color: Colors.white,
          size: 40,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, loginRoute);
          },
          child: const Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 40,
          ),
        ),
      ],
    );
  }
}
