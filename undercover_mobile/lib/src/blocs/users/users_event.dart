part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class InitializeUser extends UsersEvent {}

class ValidateUser extends UsersEvent {
  ValidateUser({
    required this.userName,
    required this.password,
  });

  final String userName;
  final String password;
}

class LogOutUser extends UsersEvent {}

class LogMeInWithFacebook extends UsersEvent {}

class LogMeInWithGoogle extends UsersEvent {}
