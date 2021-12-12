import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../blocs/genres/genres_bloc.dart';
import 'genre_card.dart';
import 'list_view.dart';

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
              final genreWidgets = List.generate(
                status.genres.length,
                (index) => GenreCellWidget(
                  title: status.genres[index].name,
                  backgroundImageUrl: status.genres[index].coverPicture,
                ),
              );

              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: platformIsNotWeb() ? 10 : 25),
                child: UndercoverListView(
                  listOfWidgets: genreWidgets,
                  numOfWidgetsOnTablet: 4,
                  numOfWidgetsOnDesktop: 6,
                  numOfWidgetsOnWideScreen: 8,
                  itemHeight: 140,
                  itemWidth: 150,
                  padding: 10,
                  leftPaddingOnPhone: 25,
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
