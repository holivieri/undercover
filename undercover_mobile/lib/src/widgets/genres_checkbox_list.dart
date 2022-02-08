import 'package:flutter/material.dart';

import '../models/genre_model.dart';

class GenresCheckboxList extends StatefulWidget {
  const GenresCheckboxList({required this.genres, Key? key}) : super(key: key);

  final List<Genre> genres;

  @override
  State<GenresCheckboxList> createState() => GenresCheckboxListState();
}

class GenresCheckboxListState extends State<GenresCheckboxList> {
  final Map<String, bool> _selectedGenres = {};
  Map<String, bool> get selectedGenres => _selectedGenres;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 600,
      child: ListView.builder(
          // shrinkWrap: true,
          itemCount: widget.genres.length,
          itemBuilder: (_, index) {
            return _showGenre(widget.genres[index]);
          }),
    );
  }

  Widget _showGenre(Genre genre) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CheckboxListTile(
        title: Text(genre.name),
        onChanged: (bool? value) {
          setState(() {
            if (value!) {
              _selectedGenres[genre.id] = value;
            } else {
              _selectedGenres.remove(genre.id);
            }
          });
        },
        value: _selectedGenres.containsKey(genre.id),
      ),
    );
  }
}
