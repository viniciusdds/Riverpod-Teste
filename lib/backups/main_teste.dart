import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {

  // ProviderScope é obrigatório
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

final counterProvider = StateProvider<int>((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // Observa o provider
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Counter'),
      ),
      body: Center(
        child: Text(
          '$counter',
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          FloatingActionButton(
            heroTag: 'plus',
            onPressed: () {
              // Executa ação
              ref.read(counterProvider.notifier).state++;
            },
            child: const Icon(Icons.add),
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: 'minus',
            onPressed: () {
              ref.read(counterProvider.notifier).state--;
            },
            child: const Icon(Icons.remove),
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: 'reset',
            onPressed: () {
              ref.read(counterProvider.notifier).state = 0;
            },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}