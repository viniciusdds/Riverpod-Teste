import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../todo/screens/todo_screen.dart';
import '../controllers/auth_controller.dart';
import '../providers/auth_providers.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userController = TextEditingController();
    final passController = TextEditingController();

    // Observa o estado do authController
    final authControllerAsync = ref.watch(authControllerProvider);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: userController,
                decoration: InputDecoration(labelText: 'Usuário'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
              ),
              SizedBox(height: 32),
              // Trata os estados de carregamento
              authControllerAsync.when(
                data: (authController) => ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.blueAccent),
                    foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () {
                    final sucesso = authController.login(
                      userController.text,
                      passController.text,
                    );

                    if (sucesso) {
                      ref.read(authStateProvider.notifier).state = AuthState(
                        isLogged: true,
                        username: userController.text,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const TodoScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login inválido')),
                      );
                    }
                  },
                  child: Text('Login'),
                ),
                loading: () => CircularProgressIndicator(),
                error: (error, stack) => Text('Erro: $error'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}