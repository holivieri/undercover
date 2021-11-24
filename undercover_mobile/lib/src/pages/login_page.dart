import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/users/users_bloc.dart';
import '../repositories/user_repository.dart';
import '../routes/routes.dart';
import '../services/user_service.dart';
import '../utils/colors.dart';
import '../widgets/input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late UsersBloc bloc;
  final TextEditingController txtUser = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    final UserService _userService = UserService();
    final UserRepository _userRepository = UserRepository(_userService);

    bloc = UsersBloc(_userRepository);
  }

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
      child: BlocListener<UsersBloc, UsersState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is UserIsValidated) {
            Navigator.pushNamed(context, homeRoute);
          }
        },
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is ValidatingUser) {
              return const CircularProgressIndicator();
            }
            if (state is UsersInitial) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    getLogo(),
                    getUserForm(),
                    getButtons(),
                  ],
                ),
              );
            }
            return Container();
          },
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
          onPressed: () {
            bloc.add(
              ValidateUser(userName: txtUser.text, password: txtPassword.text),
            );
          },
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
          TextFormField(
            scrollPhysics: const ClampingScrollPhysics(),
            textInputAction: TextInputAction.done,
            //key: widget.keyInput,
            controller: txtUser,
            autocorrect: false,
          ),
          TextFormField(
            decoration: const InputDecoration(
              fillColor: Colors.white,
              labelText: 'Password',
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              ),
            ),

            scrollPhysics: const ClampingScrollPhysics(),
            textInputAction: TextInputAction.done,
            obscureText: true,
            //key: widget.keyInput,
            controller: txtPassword,
            autocorrect: false,
          ),
        ],
      ),
    );
  }
}
