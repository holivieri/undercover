import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/places/places_bloc.dart';
import '../models/place_model.dart';
import '../utils/colors.dart';
import '../utils/font.dart';

class PlaceDetailsPage extends StatelessWidget {
  const PlaceDetailsPage({
    required this.placeId,
    required this.placesBloc,
    Key? key,
  }) : super(key: key);

  final String placeId;
  final PlacesBloc placesBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesBloc, PlacesState>(
      bloc: placesBloc,
      builder: (context, state) {
        if (state is FetchingPlace) {
          return const CircularProgressIndicator();
        } else if (state is PlaceReady) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration:
                  const BoxDecoration(gradient: themeBackgroundGradient),
              child: mainBody(state.place),
            ),
          );
        } else if (state is PlacesError) {
          return const Text('Error');
        } else {
          return Container();
        }
      },
    );
  }

  Widget mainBody(Place place) {
    return SingleChildScrollView(
      child: Column(
        children: [
          getPlaceCoverPicture(place),
          getPlaceInfo(place),
        ],
      ),
    );
  }

  Widget getPlaceCoverPicture(Place place) {
    return Container(
      width: double.infinity,
      height: 400,
      child: Image.network(place.coverPicture!),
    );
  }

  Widget getPlaceInfo(Place place) {
    return Column(
      children: [
        Text(
          place.name,
          style: titleStyle,
        ),
        const SizedBox(height: 15),
        Text(place.city),
        const SizedBox(height: 15),
        Text(place.seats.toString()),
      ],
    );
  }
}
