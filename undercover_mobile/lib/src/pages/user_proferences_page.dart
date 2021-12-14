import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../themes/theme_provider.dart';

class UserPreferencesPage extends StatefulWidget {
  const UserPreferencesPage({Key? key}) : super(key: key);

  @override
  State<UserPreferencesPage> createState() => _UserPreferencesPageState();
}

class _UserPreferencesPageState extends State<UserPreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return getBody(context);
  }

  Widget getBody(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Hero(
          tag: 'logoTag',
          child: Image.asset(
            'assets/images/Logo_small.png',
            width: 300,
            height: 300,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(S.of(context).darkMode),
            Switch.adaptive(
              value: themeProvider.isDarkMode,
              onChanged: themeProvider.toggleTheme,
            ),
          ],
        ),
      ],
    );
  }
}
