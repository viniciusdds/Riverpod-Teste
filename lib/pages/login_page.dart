import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meu_app_riverpod/pages/home_page.dart';

import 'package:meu_app_riverpod/providers/providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>{

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authState = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {

      // ScaffoldMessenger.of(context)
      //     .showSnackBar(
      //     const SnackBar(
      //        content: Text('Login realizado')
      //     )
      // );

      if(next.user != null) {
         Navigator.pushReplacement(
             context,
             MaterialPageRoute(
                 builder: (_) => HomeScreen(
                  // user: next.user!,
                 )
             ),
         );
      }

      if(next.error != null){
        ScaffoldMessenger.of(context)
            .showSnackBar(
              SnackBar(content: Text(next.error!))
            );
      }

    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email'
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha'
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
                onPressed: authState.loading ? null : (){
                  
                  ref.read(authProvider.notifier).login(emailController.text, senhaController.text);
                  
                }, 
                child: authState.loading 
                ? const CircularProgressIndicator()
                : const Text('Entrar')    
            )

          ],
        ),
      ),
    );
  }
}