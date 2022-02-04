import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/artist_profile_request_model.dart';
import '../routes/routes.dart';
import '../services/artists_service.dart';
import '../utils/app_colors.dart';

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
    return Column();
  }

  Widget _showOwnerFields() {
    final twitterController = TextEditingController();
    final facebookController = TextEditingController();
    final addressController = TextEditingController();
    final barNameController = TextEditingController();

    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 150,
              width: 600,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('Subir Foto', style: TextStyle(fontSize: 20)),
                  Icon(
                    FontAwesomeIcons.photoVideo,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: barNameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nombre del Bar',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: addressController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Domicilio',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: addressController,
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
            final ArtistBasicProfile artist = ArtistBasicProfile(
              name: artistController.text,
              bio: biografiaController.text,
              genres: <Genre>[],
              pictureUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE5v13vHH1y3gQZFczqRvbTozeQmEnUZ9n8w&usqp=CAU',
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

            final service = ArtistService();
            final result = await service.createNewArtistProfile(artistProfile);

            if (result) {
              await Navigator.pushReplacementNamed(context, homeRoute);
            }
          }
          if (widget.profile == 'owner') {}
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
            onTap: () {},
            child: Container(
              height: 150,
              width: 600,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('Subir Foto', style: TextStyle(fontSize: 20)),
                  Icon(
                    FontAwesomeIcons.photoVideo,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            maxLength: 200,
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
