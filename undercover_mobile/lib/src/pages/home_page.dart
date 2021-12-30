import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../themes/theme_provider.dart';
import 'home_screen.dart';
import 'notifications_page.dart';
import 'search_page.dart';
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
    const SearchPage(),
    const NotificationsPage(),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
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
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.home_rounded),
                      label: S.of(context).home,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.search),
                      label: S.of(context).search,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.notifications),
                      label: S.of(context).notifications,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.person),
                      label: S.of(context).profile,
                    ),
                  ],
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  selectedItemColor: theme.getSelectedIconColor(),
                  unselectedItemColor: Colors.grey,
                )),
          ),
        ),
      ),
    );
  }
}
