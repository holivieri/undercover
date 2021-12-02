import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';
import '../widgets/undercover_nav_bar.dart';

class UserPreferencesPage extends StatelessWidget {
  const UserPreferencesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: getBody(context),
      bottomNavigationBar: UndercoverNavBar(),
    );
  }

  Widget getBody(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Switch.adaptive(
          value: themeProvider.isDarkMode,
          onChanged: themeProvider.toggleTheme,
        )
      ],
    );
  }
}
