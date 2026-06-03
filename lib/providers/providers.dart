import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meu_app_riverpod/providers/auth_provider.dart';
import 'package:meu_app_riverpod/repositories/auth_repository.dart';
import 'package:meu_app_riverpod/services/api_service.dart';

import 'auth_state.dart';

final apiServiceProvider =
Provider<ApiService>((ref) {
  return ApiService();
});

final authRepositoryProvider =
Provider<AuthRepository>((ref) {

  return AuthRepository(
    ref.read(apiServiceProvider),
  );
});

final authProvider =
StateNotifierProvider<
    AuthNotifier,
    AuthState>((ref) {

  return AuthNotifier(
    ref.read(authRepositoryProvider),
  );
});