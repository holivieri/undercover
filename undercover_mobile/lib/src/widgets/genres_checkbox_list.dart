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
    return ListView.builder(
        itemCount: widget.genres.length,
        itemBuilder: (_, index) {
          return _showGenre(widget.genres[index]);
        });
  }

  Widget _showGenre(Genre genre) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: Container(
            width: 80,
            child: FittedBox(
              child: Image.network(genre.coverPicture ??
                  'https://media.istockphoto.com/photos/vinyl-record-picture-id134119615?k=20&m=134119615&s=612x612&w=0&h=zI6Fig1j8mbZp16CgvaDRMPHAzTaBNhhcBR0AldRXtw='),
            ),
          ),
          title: Text(genre.name),
          trailing: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(S.of(context).select),
                Checkbox(
                  value: _selected.containsKey(genre.id),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        _selected[genre.id] = value;
                      } else {
                        _selected.remove(genre.id);
                      }
                    });
                    //call Add/remove method
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
