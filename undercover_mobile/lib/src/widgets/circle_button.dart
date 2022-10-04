import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    required this.icon,
    required this.onTap,
    this.backgroundColor = themeBlue,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final Color backgroundColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: themeBlue,
      backgroundColor: backgroundColor,
      minimumSize: const Size(45, 45),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const CircleBorder(),
    );

    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: onTap,
      child: Icon(
        icon,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}
