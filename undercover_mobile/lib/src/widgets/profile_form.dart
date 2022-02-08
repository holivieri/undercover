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
  final addressNumberController = TextEditingController();
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
        children: const [
          Text('Subir Foto', style: TextStyle(fontSize: 20)),
          Icon(
            FontAwesomeIcons.photoVideo,
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
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nombre del Bar',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: barDescriptionController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Descripcion',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: cityController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Ciudad',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: provinceController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Provincia',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: addressController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Domicilio Calle Nombre',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: addressNumberController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Domicilio Calle Numero',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: floorController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Piso',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: seatsController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Capacidad asientos',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: standingController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Capacidad Parados',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: telefonoController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Telefono',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: twitterController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Cuenta de Twitter',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: facebookController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Cuenta de Facebook',
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
          primary: greenButtonColor,
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
              streetNumber: addressController.text,
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
                .map((e) => MyEntity(id: e.key))
                .toList();
            print(listOfGenresSelected.length);

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
        child: const Text(
          'Register',
          style: TextStyle(backgroundColor: buttonColor),
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
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nombre del Artista o Banda',
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
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Contanos tu historia',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            maxLength: 100,
            autocorrect: false,
            controller: managerController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nombre del Manager',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            maxLength: 200,
            autocorrect: false,
            controller: managerContactoController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email/Telefono del Manager',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: twitterController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Cuenta de Twitter',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: soundCloudController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Cuenta de SoundCloud',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: spotifyController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Cuenta de Spotify',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: facebookController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Cuenta de Facebook',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: youtubeController,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Cuenta de Youtube',
            ),
          ),
        ),
      ],
    );
  }
}
