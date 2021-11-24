import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';
import '../../repositories/user_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc(this.userRepository) : super(UsersInitial()) {
    on<ValidateUser>(
      (event, emit) async {
        final user = await userRepository.login(event.userName, event.password);
        if (user is User) {
          emit(UserIsValidated(user));
        } else {
          emit(ValidateError(user.toString()));
        }
      },
    );
    on<InitializeUser>((event, emit) {
      emit(UsersInitial());
    });
  }

  final UserRepository userRepository;
}
