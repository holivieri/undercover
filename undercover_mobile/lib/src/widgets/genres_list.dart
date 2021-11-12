import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../blocs/genres/genres_bloc.dart';
import 'genre_card.dart';

class GenresList extends StatelessWidget {
  const GenresList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GenresBloc, GenresState>(
          builder: (context, status) {
            if (status is LoadingGenres) {
              return const CircularProgressIndicator();
            } else if (status is GenresLoaded) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: platformIsNotWeb() ? 10 : 25),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: List.generate(
                    status.genres.length,
                    (index) => GenreCellWidget(
                      // backgroundImageUrl: status.genres[index].cover,
                      title: status.genres[index].name,
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }
}
