import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meu_app_riverpod/backups/features/auth/screens/login_screen.dart';
import 'package:meu_app_riverpod/models/user.dart';
import 'package:meu_app_riverpod/providers/providers.dart';

class HomeScreen extends ConsumerWidget  {

  const HomeScreen({
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Olá ${authState.user?.nome}"),
        actions: [
          IconButton(
              onPressed: () async {
                await ref.read(authProvider.notifier).logout();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false
                );
              },
              icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: const Center(
        child: Text(
          'Usuário logado com sucesso',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}