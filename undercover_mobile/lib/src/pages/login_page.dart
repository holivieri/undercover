import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:undercover_mobile/src/models/user_preferences.dart';

import '../blocs/users/users_bloc.dart';
import '../repositories/user_repository.dart';
import '../routes/routes.dart';
import '../services/user_service.dart';
import '../utils/colors.dart';

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
            print(state.user.token);

            UserPreferences().token = state.user.token;
            UserPreferences().userName = state.user.userName;
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
            if (state is ValidateError) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    getLogo(),
                    getErrorMessage(state.message),
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

  Widget getErrorMessage(String error) {
    return Container(
      height: 200,
      width: double.infinity,
      color: themeDanger,
      child: Text(
        error,
        style: const TextStyle(color: Colors.white),
      ),
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
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'User',
              prefixIcon: Icon(
                Icons.person,
                color: Colors.teal,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
            ),
            scrollPhysics: const ClampingScrollPhysics(),
            textInputAction: TextInputAction.done,
            controller: txtUser,
            autocorrect: false,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'Password',
              prefixIcon: Icon(
                Icons.password,
                color: Colors.teal,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
            ),
            scrollPhysics: const ClampingScrollPhysics(),
            textInputAction: TextInputAction.done,
            obscureText: true,
            controller: txtPassword,
            autocorrect: false,
          ),
        ],
      ),
    );
  }
}
