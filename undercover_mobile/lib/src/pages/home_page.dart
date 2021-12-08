import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';
import 'home_screen.dart';
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
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search), label: 'Search'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.notifications),
                        label: 'Notifications'),
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
                )),
          ),
        ),
      ),
    );
  }
}
