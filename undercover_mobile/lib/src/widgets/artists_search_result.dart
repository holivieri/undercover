import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../models/artist_model.dart';

class ArtistSearchResultList extends StatefulWidget {
  const ArtistSearchResultList({required this.artists, Key? key})
      : super(key: key);

  final List<Artist> artists;

  @override
  State<ArtistSearchResultList> createState() => _ArtistSearchResultListState();
}

class _ArtistSearchResultListState extends State<ArtistSearchResultList> {
  final Map<String, bool> _selected = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.artists.length,
        itemBuilder: (_, index) {
          return _showArtist(widget.artists[index]);
        });
  }

  Widget _showArtist(Artist artist) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: Container(
            width: 80,
            child: FittedBox(
              child: Image.network(artist.pictureUrl!),
            ),
          ),
          title: Text(artist.name),
          subtitle:
              Text(artist.genres.isNotEmpty ? artist.genres[0].name : 'Rock'),
          trailing: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(S.of(context).select),
                Checkbox(
                  value: _selected.containsKey(artist.id),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        _selected[artist.id] = value;
                      } else {
                        _selected.remove(artist.id);
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
