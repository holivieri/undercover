import '../errors/login_error.dart';
import '../services/user_service.dart';

class UserRepository {
  UserRepository(this.userService);

  final UserService userService;

  Future<dynamic> login(String? userName, String? password) async {
    if (userName == null || password == null) {
      return LoginError(
          code: '1', description: 'Usuario y Clave son obligatorios');
    }

    return userService.login(userName, password);
  }
}
