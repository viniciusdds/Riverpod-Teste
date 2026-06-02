import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/core_providers.dart';
import '../controllers/auth_controller.dart';

// Provider do AuthController - AGORA É FutureProvider também!
final authControllerProvider = FutureProvider<AuthController>((ref) async {
  // Espera o SharedPreferences estar pronto
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return AuthController(prefs);
});

// Provider do estado de auth
final authStateProvider = StateProvider<AuthState>((ref) {
  return const AuthState();
});