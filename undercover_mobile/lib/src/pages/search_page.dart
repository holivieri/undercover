import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/artists/my_artists_bloc.dart';
import '../repositories/artists_repository.dart';
import '../services/artists_service.dart';
import '../widgets/artists_search_result.dart';

//Search for Artists
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _txtController = TextEditingController();
  late final MyArtistsBloc artistBloc;

  @override
  void initState() {
    super.initState();
    final ArtistService service = ArtistService();

    final ArtistRepository repository = ArtistRepository(service);

    artistBloc = MyArtistsBloc(repository);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: _txtController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Artist Name',
            ),
            onEditingComplete: () {
              print(_txtController.text);
              artistBloc.add(SearchArtists(_txtController.text));
            },
          ),
        ),
        const SizedBox(height: 20),
        showResult(),
      ],
    );
  }

  Widget showResult() {
    return BlocBuilder<MyArtistsBloc, MyArtistsBlocState>(
      bloc: artistBloc,
      builder: (context, state) {
        if (state is SearchingArtists) {
          return const CircularProgressIndicator();
        }
        if (state is ArtistsFound) {
          final artists = state.artists;
          print('Artista encontrado');
          return Expanded(
            child: ArtistSearchResultList(artists: artists),
          );
        }
        return Container();
      },
    );
  }
}
