import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../generated/l10n.dart';
import '../blocs/users/users_bloc.dart';
import '../models/user_preferences.dart';
import '../repositories/user_repository.dart';
import '../routes/routes.dart';
import '../services/user_service.dart';
import '../utils/app_colors.dart';
import '../utils/colors.dart';
import '../utils/font.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late UsersBloc bloc;
  late String _error;
  final TextEditingController txtUser = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    final UserService _userService = UserService();
    final UserRepository _userRepository = UserRepository(_userService);

    bloc = UsersBloc(_userRepository);
    _error = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: darkBackground,
        child: getBody(),
      ),
    );
  }

  Widget showError() {
    return Container(
      height: 100,
      color: themeDanger,
      child: Text(
        'Error: $_error',
        style: const TextStyle(color: Colors.white),
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
            UserPreferences().tokenExpirationDate =
                state.user.expiration.toString();

            if (UserPreferences().profile == MyProfile.none) {
              Navigator.pushReplacementNamed(context, createProfileRoute);
            } else {
              Navigator.pushReplacementNamed(context, homeRoute);
            }
          }
          if (state is ValidatingUser) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 200,
                    width: 400,
                    child: AlertDialog(
                      title: Text(S.of(context).pleaseWait),
                      content: const CircularProgressIndicator(),
                    ),
                  ),
                );
              },
            );
          }
        },
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is ValidatingUser) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UsersInitial) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    if (_error.isNotEmpty) showError(),
                    getLogo(),
                    getUserForm(),
                    const SizedBox(height: 20),
                    getLoginButton(),
                    getSocialLoginButtons(),
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
                    getLoginButton(),
                    const SizedBox(height: 20),
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
      'assets/images/Logo_small.png',
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

  Widget getLoginButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 600,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: greenButtonColor,
          ),
          onPressed: () {
            bloc.add(
              ValidateUser(userName: txtUser.text, password: txtPassword.text),
            );
          },
          child: Text(S.of(context).logIn),
        ),
      ),
    );
  }

  Widget getSocialLoginButtons() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Or', //S.of(context).or,
            style: subtitleStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            googleButton(),
            facebookButton(),
            appleButton(),
          ],
        )
      ],
    );
  }

  Widget googleButton() {
    return Container(
      height: 50,
      width: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkControlColor,
          ),
          onPressed: () async {
            print('Google');
            bloc.add(LogMeInWithGoogle());
          },
          child: const Icon(
            FontAwesomeIcons.google,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget appleButton() {
    return Container(
      height: 50,
      width: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkControlColor,
          ),
          onPressed: () {
            print('Apple');
          },
          child: const Icon(
            FontAwesomeIcons.apple,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget facebookButton() {
    return Container(
      height: 50,
      width: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkControlColor,
          ),
          onPressed: () async {
            print('Facebook');
            bloc.add(LogMeInWithFacebook());
          },
          child: const Icon(
            FontAwesomeIcons.facebook,
            color: facebookColor,
          ),
        ),
      ),
    );
  }

  Widget getUserForm() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: TextFormField(
              decoration: const InputDecoration(
                fillColor: darkControlColor,
                filled: true,
                hintText: 'Your Email Address',
                labelText: 'User',
                prefixIcon: Icon(
                  Icons.person,
                  color: greenButtonColor,
                ),
              ),
              style: const TextStyle(color: Colors.white),
              scrollPhysics: const ClampingScrollPhysics(),
              textInputAction: TextInputAction.done,
              controller: txtUser,
              autocorrect: false,
            ),
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: TextFormField(
              decoration: const InputDecoration(
                fillColor: darkControlColor,
                filled: true,
                hintText: 'Your Password',
                labelText: 'Password',
                prefixIcon: Icon(
                  Icons.password,
                  color: greenButtonColor,
                ),
              ),
              style: const TextStyle(color: Colors.white),
              scrollPhysics: const ClampingScrollPhysics(),
              textInputAction: TextInputAction.done,
              obscureText: true,
              controller: txtPassword,
              autocorrect: false,
            ),
          ),
        ],
      ),
    );
  }
}
