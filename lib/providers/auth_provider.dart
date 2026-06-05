import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {

  final AuthRepository repository;

  AuthNotifier(this.repository) : super(AuthState());

  Future<void> login(
    String email,
    String senha
  ) async {

    try{

      state = state.copyWith(
        loading: true,
        error: null
      );

      final user = await repository.login(email: email, senha: senha);

      state = state.copyWith(
          loading: false,
          user: user
      );

    }catch(e){

      state = state.copyWith(
        loading: false,
        error: e.toString()
      );
    }
  }

  Future<void> logout() async {
    state = AuthState();
  }
}