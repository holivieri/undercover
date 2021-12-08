import 'package:flutter/material.dart';

//Search for Artists
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Artist Name',
            ),
          ),
        ),
        showResult(),
      ],
    );
  }

  Widget showResult() {
    return const Text('No Results');
  }
}
