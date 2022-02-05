import 'package:flutter/material.dart';

import '../widgets/are_you_a_bar_owner_widget.dart';
import '../widgets/are_you_an_artist_widget.dart';
import '../widgets/profile_form.dart';

class WizardProfile extends StatefulWidget {
  const WizardProfile({Key? key}) : super(key: key);

  @override
  State<WizardProfile> createState() => _WizardProfileState();
}

class _WizardProfileState extends State<WizardProfile> {
  int _currentStep = 0;
  bool _isArtist = false;
  bool _isOwner = false;

  static const TextStyle _headerStyle = TextStyle(fontSize: 24);

  StepState _stepState(int step) {
    if (_currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  List<Step> _steps() => [
        Step(
          title: const Text('¿Sos músico o artista?', style: _headerStyle),
          content: const AreYouAnArtist(),
          state: _stepState(0),
          isActive: _currentStep == 0,
        ),
        Step(
          title: const Text('¿Tienes un bar y queres invitar músicos a tocar?',
              style: _headerStyle),
          state: _stepState(1),
          content: const AreYouABarOwner(),
          isActive: _currentStep == 1,
        ),
        Step(
          title: const Text('Completa tu información', style: _headerStyle),
          content: _isArtist
              ? const ProfileForm(profile: 'artist')
              : _isOwner
                  ? const ProfileForm(profile: 'owner')
                  : const ProfileForm(profile: 'user'),
          state: _stepState(2),
          isActive: _currentStep == 2,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
      ),
      body: Stepper(
        steps: _steps(),
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: _currentStep == 0
                ? firstStepButtons(controls)
                : _currentStep == 1
                    ? secondStepButtons(controls)
                    : Container(),
          );
        },
        onStepContinue: () {
          setState(() {
            if (_currentStep < _steps().length - 1) {
              _currentStep += 1;
            } else {
              _currentStep = 0;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep -= 1;
            } else {
              _currentStep = 0;
            }
          });
        },
        currentStep: _currentStep,
        //type: StepperType.horizontal,
      ),
    );
  }

  Widget firstStepButtons(ControlsDetails controls) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
            textStyle:
                const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            setState(() {
              _isArtist = true;
              _currentStep = 2;
            });
            controls.onStepContinue!;
          },
          child: const Text(
            'SI',
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
            textStyle:
                const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            setState(() {
              _isArtist = false;
              _currentStep = 1;
            });

            controls.onStepContinue!;
          },
          child: const Text('NO'),
        ),
      ],
    );
  }

  Widget secondStepButtons(ControlsDetails controls) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
            textStyle:
                const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            setState(() {
              _isOwner = true;
              _currentStep = 2;
            });
          },
          child: const Text('SI'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
            textStyle:
                const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            setState(() {
              _isOwner = false;
              _currentStep = 2;
            });
          },
          child: const Text('NO'),
        ),
      ],
    );
  }
}
