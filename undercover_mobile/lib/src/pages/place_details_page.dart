import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../blocs/places/places_bloc.dart';
import '../models/place_model.dart';
import '../repositories/places_repository.dart';
import '../services/places_service.dart';
import '../utils/app_colors.dart';
import '../utils/font.dart';
import '../widgets/back_button.dart';

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
            appBar: AppBar(
              leading: const BackArrowButton(),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            extendBodyBehindAppBar: true,
            body: Container(
              height: double.infinity,
              width: double.infinity,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${place.name} - ${place.city}',
                  style: titleStyle,
                ),
                getSocialNetworkIcons(),
              ],
            ),
          ),
          const SizedBox(height: 30),
          getPlaceInfo(place),
        ],
      ),
    );
  }

  Widget getSocialNetworkIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            FontAwesomeIcons.facebook,
            size: 35,
            color: facebookColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            FontAwesomeIcons.youtube,
            size: 35,
            color: youtubeColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            FontAwesomeIcons.twitter,
            size: 35,
            color: twitterColor,
          ),
        ),
      ],
    );
  }

  Widget getPlaceCoverPicture(Place place) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: Container(
        width: double.infinity,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(place.coverPicture!),
        ),
      ),
    );
  }

  Widget getPlaceInfo(Place place) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
              padding: const EdgeInsets.all(8),
              height: 600,
              width: 300,
              child: Text(place.description ?? '')),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(0.5),
          ),
          width: 250,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    const Icon(FontAwesomeIcons.phone),
                    Text(place.phoneNumber ?? ''),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(FontAwesomeIcons.archway),
                    Text(place.totalCapacity.toString()),
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
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(FontAwesomeIcons.male),
                    Text(place.totalCapacity.toString()),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
