part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class ValidatingUser extends UsersState {}

class UserIsValidated extends UsersState {
  UserIsValidated(this.user);

  final User user;
}

class ValidateError extends UsersState {
  ValidateError(this.message);

  final String message;
}
