import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_providers.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoControllerProvider);
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Minhas Tarefas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Nova tarefa...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      ref.read(todoControllerProvider.notifier).addTodo(controller.text);
                      controller.clear();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.blueAccent),
                    foregroundColor: WidgetStatePropertyAll<Color>(Colors.white)
                  ),
                  child: Text('Adicionar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: todos.isEmpty
                ? Center(child: Text('Nenhuma tarefa'))
                : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.done,
                    onChanged: (_) {
                      ref.read(todoControllerProvider.notifier).toggleTodo(todo.id);
                    },
                  ),
                  title: Text(todo.title),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      ref.read(todoControllerProvider.notifier).removeTodo(todo.id);
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