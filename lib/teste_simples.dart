// // main.dart
// Exemplo 1
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// void main() {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }
//
// // Provider simples - valor constante
// final mensagemProvider = Provider<String>((ref) {
//   return 'Olá, Riverpod!';
// });
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final mensagem = ref.watch(mensagemProvider);
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Exemplo 1')),
//       body: Center(
//         child: Text(
//           mensagem,
//           style: TextStyle(fontSize: 30),
//         ),
//       ),
//     );
//   }
// }

// Exemplo 2
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// void main() {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }
//
// // Provider com estado mutável
// final contadorProvider = StateProvider<int>((ref) => 0);
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ContadorPage(),
//     );
//   }
// }
//
// class ContadorPage extends ConsumerWidget {
//   const ContadorPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final contador = ref.watch(contadorProvider);
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Contador')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               '$contador',
//               style: TextStyle(fontSize: 60),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     ref.read(contadorProvider.notifier).state--;
//                   },
//                   child: Text('-'),
//                 ),
//                 SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     ref.read(contadorProvider.notifier).state++;
//                   },
//                   child: Text('+'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Exemplo 3
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// void main() {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }
//
// // Provider para controlar o tema
// final temaEscuroProvider = StateProvider<bool>((ref) => false);
//
// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final temaEscuro = ref.watch(temaEscuroProvider);
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       themeMode: temaEscuro ? ThemeMode.dark : ThemeMode.light,
//       home: TemaPage(),
//     );
//   }
// }
//
// class TemaPage extends ConsumerWidget {
//   const TemaPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final temaEscuro = ref.watch(temaEscuroProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Alternar Tema'),
//         actions: [
//           IconButton(
//             icon: Icon(
//               temaEscuro ? Icons.light_mode : Icons.dark_mode,
//             ),
//             onPressed: () {
//               ref.read(temaEscuroProvider.notifier).state = !temaEscuro;
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text(
//           temaEscuro ? 'Modo Escuro 🌙' : 'Modo Claro ☀️',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// Provider para gerenciar a lista de tarefas
final tarefasProvider = StateProvider<List<String>>((ref) => []);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TarefasPage(),
    );
  }
}

class TarefasPage extends ConsumerWidget {
  const TarefasPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tarefas = ref.watch(tarefasProvider);
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Minhas Tarefas')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Nova tarefa...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.blue, size: 40),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      final novaTarefa = controller.text;
                      ref.read(tarefasProvider.notifier).state = [
                        ...tarefas,
                        novaTarefa,
                      ];
                      controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: tarefas.isEmpty
                ? Center(child: Text('Nenhuma tarefa ainda'))
                : ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tarefas[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      final novasTarefas = [...tarefas];
                      novasTarefas.removeAt(index);
                      ref.read(tarefasProvider.notifier).state = novasTarefas;
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}