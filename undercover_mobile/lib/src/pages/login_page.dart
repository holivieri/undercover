import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/input_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: themeBackgroundGradient),
        child: getBody(),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            getLogo(),
            getUserForm(),
            getButtons(),
          ],
        ),
      ),
    );
  }

  Widget getLogo() {
    return Image.asset(
      'images/logo.jpg',
      width: 300,
      height: 300,
    );
  }

  Widget getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Login'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Cancel'),
        )
      ],
    );
  }

  Widget getUserForm() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          InputText(
            label: 'E-mail',
            onChanged: (String value) {},
            validator: (String? email) {
              if (email == null) {
                return 'Enter a valid e-mail';
              }
              if (RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(email)) {
                return null;
              } else {
                return 'Enter a valid e-mail';
              }
            },
          ),
          InputText(
            label: 'Password',
            onChanged: (String value) {},
            validator: (String? password) {
              if (password == null) {
                return 'Enter a password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
