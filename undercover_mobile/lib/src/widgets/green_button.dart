import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({required this.label, Key? key}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: greenButtonColor,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white, //Theme.of(context).primaryColor,
          ),
        ),
        onPressed: () {},
        child: Text(
          label,
          style: const TextStyle(backgroundColor: buttonColor),
        ),
      ),
    );
  }
}
