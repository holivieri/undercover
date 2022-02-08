import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../models/genre_model.dart';

class GenresCheckboxList extends StatefulWidget {
  const GenresCheckboxList({required this.genres, Key? key}) : super(key: key);

  final List<Genre> genres;

  @override
  State<GenresCheckboxList> createState() => _GenresCheckboxListState();
}

class _GenresCheckboxListState extends State<GenresCheckboxList> {
  final Map<String, bool> _selected = {};

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
              _selected[genre.id] = value;
            } else {
              _selected.remove(genre.id);
            }
          });
        },
        value: _selected.containsKey(genre.id),
      ),
    );
  }
}
