import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../blocs/places/places_bloc.dart';
import 'list_view.dart';
import 'place_card.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<PlacesBloc, PlacesState>(
          builder: (context, status) {
            if (status is LoadingPlaces) {
              return const CircularProgressIndicator();
            } else if (status is PlacesLoaded) {
              final genreWidgets = List.generate(
                status.places.length,
                (index) => PlaceCard(
                  title: status.places[index].name,
                  backgroundImageUrl: status.places[index].coverPicture,
                  placeId: status.places[index].id,
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
