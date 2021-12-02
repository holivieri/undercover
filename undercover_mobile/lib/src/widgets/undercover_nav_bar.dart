import 'package:flutter/material.dart';

import '../routes/routes.dart';

class UndercoverNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, homeRoute);
                },
                child: const Icon(Icons.home_rounded),
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
          ),
        ),
      );
}
