import 'package:flutter/material.dart';

import '../widgets/are_you_a_bar_owner_widget.dart';
import '../widgets/are_you_an_artist_widget.dart';

class WizardProfile extends StatefulWidget {
  const WizardProfile({Key? key}) : super(key: key);

  @override
  State<WizardProfile> createState() => _WizardProfileState();
}

class _WizardProfileState extends State<WizardProfile> {
  int _currentStep = 0;

  StepState _stepState(int step) {
    if (_currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  List<Step> _steps() => [
        Step(
          title: const Text('¿Sos músico o artista?'),
          content: const AreYouAnArtist(),
          state: _stepState(0),
          isActive: _currentStep == 0,
        ),
        Step(
          title: const Text('¿Tienes un bar y queres invitar músicos a tocar?'),
          state: _stepState(1),
          content: const AreYouABarOwner(),
          isActive: _currentStep == 1,
        ),
        Step(
          title: const Text('Completa tu información'),
          content: const AreYouABarOwner(),
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
            child: Row(
              children: [
                if (_currentStep != 0)
                  TextButton(
                    onPressed: controls.onStepCancel,
                    child: const Text(
                      'BACK',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ElevatedButton(
                  onPressed: controls.onStepContinue,
                  child: const Text('NEXT'),
                ),
              ],
            ),
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
}
