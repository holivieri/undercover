import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UnderAppbar extends StatefulWidget implements PreferredSizeWidget {
  const UnderAppbar({Key? key})
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
      children: const [
        Icon(
          Icons.circle_notifications,
          color: Colors.white,
          size: 40,
        ),
        Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 40,
        ),
      ],
    );
  }
}
