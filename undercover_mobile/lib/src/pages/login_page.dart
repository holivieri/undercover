import 'package:flutter/material.dart';

import '../widgets/input_text.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          getLogo(),
          getUserForm(),
          getButtons(),
        ],
      ),
    );
  }

  Widget getLogo() {
    return Image.asset('images/logo.jpg', width: 300, height: 300,);
  }

  Widget getUserForm() {
    return Container(
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

  Widget getButtons() {
    return Row(
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
}
