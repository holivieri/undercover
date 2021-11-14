import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/places/places_bloc.dart';
import '../../main.dart';
import 'rounded_rectangle_card.dart';

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
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: platformIsNotWeb() ? 10 : 25),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: List.generate(
                    status.places.length,
                    (index) => RoundedRectangleCard(
                      backgroundImageUrl: status.places[index].coverPicture,
                      title: status.places[index].name,
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
