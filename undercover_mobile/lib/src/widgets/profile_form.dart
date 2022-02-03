import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'green_button.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({required this.profile, Key? key}) : super(key: key);
  final String profile;

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.profile == 'artist') _showArtistFields(),
        if (widget.profile == 'owner') _showOwnerFields(),
        if (widget.profile == 'user') _showUserFields(),
        const SizedBox(height: 25),
        const GreenButton(label: 'Registrar'),
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

  Widget _showArtistFields() {
    final artistController = TextEditingController();
    final biografiaController = TextEditingController();
    final twitterController = TextEditingController();
    final youtubeController = TextEditingController();
    final facebookController = TextEditingController();
    final managerContactoController = TextEditingController();
    final managerController = TextEditingController();

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
