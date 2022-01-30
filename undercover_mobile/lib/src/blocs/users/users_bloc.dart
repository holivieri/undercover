import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/login_response_model.dart';
import '../../repositories/user_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc(this.userRepository) : super(UsersInitial()) {
    on<ValidateUser>(
      (event, emit) async {
        final user = await userRepository.login(event.userName, event.password);
        if (user is LoginResponse) {
          emit(UserIsValidated(user));
        } else {
          emit(ValidateError(user.toString()));
        }
      },
    );
    on<InitializeUser>((event, emit) {
      emit(UsersInitial());
    });
    on<LogMeInWithFacebook>((event, emit) async {
      final String token = await userRepository.getFacebookToken();
      emit(ValidatingUser());
      final user = await userRepository.signInWithFacebook(token);
      emit(UserIsValidated(user));
    });
    on<LogMeInWithGoogle>((event, emit) async {
      final String token = await userRepository.getGoogleToken();
      emit(ValidatingUser());
      final user = await userRepository.signInWithGoogle(token);
      emit(UserIsValidated(user));
    });
  }

  final UserRepository userRepository;
}
