import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../generated/l10n.dart';
import '../models/artist_profile_request_model.dart';
import '../models/country_model.dart';
import '../models/genre_model.dart';
import '../models/place_owner_profile_request_model.dart';
import '../models/user_profile_request_model.dart';
import '../routes/routes.dart';
import '../services/artists_service.dart';
import '../services/genres_service.dart';
import '../services/places_service.dart';
import '../services/user_service.dart';
import '../utils/app_colors.dart';
import 'genres_checkbox_list.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({required this.profile, Key? key}) : super(key: key);
  final String profile;

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final artistController = TextEditingController();
  final biografiaController = TextEditingController();
  final twitterController = TextEditingController();
  final youtubeController = TextEditingController();
  final facebookController = TextEditingController();
  final managerContactoController = TextEditingController();
  final managerController = TextEditingController();
  final soundCloudController = TextEditingController();
  final spotifyController = TextEditingController();
  final addressController = TextEditingController();
  final barNameController = TextEditingController();
  final telefonoController = TextEditingController();
  final seatsController = TextEditingController();
  final standingController = TextEditingController();
  final floorController = TextEditingController();
  final cityController = TextEditingController();
  final barDescriptionController = TextEditingController();
  final provinceController = TextEditingController();
  XFile? _newPictureFile;
  final _genresListKey = GlobalKey<GenresCheckboxListState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.profile == 'artist') _showArtistFields(),
        if (widget.profile == 'owner') _showOwnerFields(),
        if (widget.profile == 'user') _showUserFields(),
        const SizedBox(height: 25),
        _registerProfileButton(),
      ],
    );
  }

  Widget _showUserFields() {
    return Column(
      children: [
        Text(
          S.of(context).whatKindOfMusic,
          style: const TextStyle(fontSize: 22),
        ),
        FutureBuilder(
          future: GenresService().getAllGenres(),
          builder: (_, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return GenresCheckboxList(
                genres: snapshot.data,
                key: _genresListKey,
              );
            }
          },
        ),
      ],
    );
  }

  Widget getPicture() {
    if (_newPictureFile == null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            S.of(context).uploadPicture,
            style: const TextStyle(fontSize: 20, color: Colors.redAccent),
          ),
          const Icon(
            FontAwesomeIcons.photoFilm,
            color: Colors.white,
          ),
        ],
      );
    }
    return Image.file(
      File(_newPictureFile!.path),
      fit: BoxFit.cover,
    );
  }

  Widget _showOwnerFields() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: InkWell(
            onTap: () async {
              final picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                setState(() {
                  _newPictureFile = image;
                });
              }
            },
            child: Container(
              height: 150,
              width: 600,
              color: Colors.black,
              child: getPicture(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: barNameController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).barName,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: barDescriptionController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).description,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: cityController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).city,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: provinceController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).province,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: addressController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).addressStreet,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: floorController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).floor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: seatsController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).seats,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: standingController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).standing,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: telefonoController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).phone,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: twitterController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).twitterAccount,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: facebookController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).facebookAccount,
            ),
          ),
        ),
      ],
    );
  }

  Widget _registerProfileButton() {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: greenButtonColor,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white, //Theme.of(context).primaryColor,
          ),
        ),
        onPressed: () async {
          if (widget.profile == 'artist') {
            final service = ArtistService();
            String? photoUrl;

            if (_newPictureFile != null) {
              photoUrl = await UserService().uploadImage(_newPictureFile!.path);
            }

            final ArtistBasicProfile artist = ArtistBasicProfile(
              name: artistController.text,
              bio: biografiaController.text,
              genres: <Genre>[],
              pictureUrl: photoUrl ?? '',
              managerName: managerController.text,
              managerContact: managerContactoController.text,
              facebookAccount: facebookController.text,
              youTubeAccount: youtubeController.text,
              soundCloudAccount: soundCloudController.text,
              twitterAccount: twitterController.text,
              spotifyAccount: spotifyController.text,
            );

            final ArtistProfileRequest artistProfile =
                ArtistProfileRequest(artist: artist);

            final result = await service.createNewArtistProfile(artistProfile);

            if (result) {
              await Navigator.pushReplacementNamed(context, homeRoute);
            }
          }
          if (widget.profile == 'owner') {
            String? photoUrl;

            if (_newPictureFile != null) {
              photoUrl = await UserService().uploadImage(_newPictureFile!.path);
            }

            final PlaceBasicProfile place = PlaceBasicProfile(
              name: barNameController.text,
              description: barDescriptionController.text,
              phoneNumber: telefonoController.text,
              seats: int.parse(seatsController.text),
              floor: floorController.text,
              streetName: addressController.text,
              city: cityController.text,
              province: provinceController.text,
              coverPicture: photoUrl ??
                  'https://s3-media0.fl.yelpcdn.com/bphoto/gf8dBRYYV9n6Zn2OdVflhg/l.jpg',
              country: Country(
                name: 'Argentina',
                id: '0e0d7e2e-6624-4315-89b0-cedf9ae190b3',
              ),
            );

            final PlaceOwnerProfileRequest placeProfile =
                PlaceOwnerProfileRequest(place: place);

            final PlacesService service = PlacesService();
            final bool result =
                await service.createNewPlaceOwnerProfile(placeProfile);
            if (result) {
              await Navigator.pushReplacementNamed(context, homeRoute);
            }
          }

          if (widget.profile == 'user') {
            final listOfGenresSelected = _genresListKey
                .currentState!.selectedGenres.entries
                .map((e) => Genre(id: e.key, name: e.value.name))
                .toList();

            final UserProfileRequest userRequest =
                UserProfileRequest(user: User(myGenres: listOfGenresSelected));
            final UserService userService = UserService();

            final bool result =
                await userService.createNewUserProfile(userRequest);
            if (result) {
              await Navigator.pushReplacementNamed(context, homeRoute);
            }
          }
        },
        child: Text(
          S.of(context).register,
          style: const TextStyle(backgroundColor: buttonColor),
        ),
      ),
    );
  }

  Widget _showArtistFields() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: InkWell(
            onTap: () async {
              final picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                setState(() {
                  _newPictureFile = image;
                });
              }
            },
            child: Container(
              height: 150,
              width: 600,
              color: Colors.black,
              child: getPicture(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            maxLength: 200,
            autocorrect: false,
            controller: artistController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).artistName,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            maxLength: 1000,
            maxLines: 4,
            autocorrect: false,
            controller: biografiaController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).tellUsAboutYou,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            maxLength: 100,
            autocorrect: false,
            controller: managerController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).managerName,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            maxLength: 200,
            autocorrect: false,
            controller: managerContactoController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).managerContactInformation,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: twitterController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).twitterAccount,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: soundCloudController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).soundCloud,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: spotifyController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).spotifyAccount,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: facebookController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).facebookAccount,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: youtubeController,
            autocorrect: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: S.of(context).youtubeAccount,
            ),
          ),
        ),
        FutureBuilder(
          future: GenresService().getAllGenres(),
          builder: (_, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return GenresCheckboxList(
                genres: snapshot.data,
                key: _genresListKey,
              );
            }
          },
        ),
      ],
    );
  }
}
