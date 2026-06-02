// Não precisa mais do GetxController!
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final SharedPreferences storage;

  AuthController(this.storage);

  bool isLogged = false;
  String username = '';

  bool login(String user, String password) {
    if (user == 'admin' && password == '123') {
      isLogged = true;
      username = user;
      storage.setString('token', 'fake-token');
      return true;
    }
    return false;
  }

  void logout() {
    isLogged = false;
    username = '';
    storage.remove('token');
  }
}

// Estado imutável para a UI
class AuthState {
  final bool isLogged;
  final String username;

  const AuthState({this.isLogged = false, this.username = ''});

  AuthState copyWith({bool? isLogged, String? username}) {
    return AuthState(
      isLogged: isLogged ?? this.isLogged,
      username: username ?? this.username,
    );
  }
}