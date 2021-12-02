import 'package:flutter/material.dart';

import '../widgets/undercover_nav_bar.dart';

class UserPreferencesPage extends StatelessWidget {
  const UserPreferencesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: UndercoverNavBar(),
    );
  }
}
