import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../blocs/places/places_bloc.dart';
import '../models/place_model.dart';
import '../repositories/places_repository.dart';
import '../services/places_service.dart';
import '../utils/colors.dart';
import '../utils/font.dart';

class PlaceDetailsPage extends StatefulWidget {
  const PlaceDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PlaceDetailsPage> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  final String? _placeId = Get.arguments;
  late final PlacesBloc placesBloc;

  @override
  void initState() {
    super.initState();
    final PlacesService service = PlacesService();
    final PlacesRepository repository = PlacesRepository(service);

    placesBloc = PlacesBloc(repository)
      ..add(
        FetchPlace(_placeId!),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesBloc, PlacesState>(
      bloc: placesBloc,
      builder: (context, state) {
        if (state is FetchingPlace) {
          return const CircularProgressIndicator();
        } else if (state is PlaceLoaded) {
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
          const SizedBox(height: 20),
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.lightBlue[50]!.withOpacity(0.5),
      ),
      width: 250,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text(
              place.name,
              style: subtitleStyle,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.location_city),
                Text(place.city),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.chair),
                Text(place.seats.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
