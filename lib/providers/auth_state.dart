

import '../models/user.dart';

class AuthState {

  final bool loading;
  final User? user;
  final String? error;

  AuthState({
    this.loading = false,
    this.user,
    this.error,
  });

  AuthState copyWith({
    bool? loading,
    User? user,
    String? error,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      user: user ?? this.user,
      error: error,
    );
  }
}