import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';
import 'home_screen.dart';
import 'user_proferences_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final tabs = [
    const HomeScreen(),
    Container(),
    Container(),
    const UserPreferencesPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: tabs[_selectedIndex],
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Container(
              height: 60,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(color: Colors.grey),
                ],
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: BottomNavigationBar(
                backgroundColor: theme.getControlColor(),
                currentIndex: _selectedIndex,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: 'Search'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications), label: 'Notifications'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                selectedItemColor: theme.getSelectedIconColor(),
                unselectedItemColor: Colors.grey,
              )

              /*  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, homeRoute);
                },
                child: Column(
                  children: [
                    const Icon(Icons.home_rounded),
                    Container(
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.search),
              const Icon(Icons.camera_alt),
              const Icon(Icons.notifications),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, userPreferencesRoute);
                },
                child: const Icon(Icons.person),
              )
            ],
          ), */
              ),
        ),
      ),
    );
  }
}
