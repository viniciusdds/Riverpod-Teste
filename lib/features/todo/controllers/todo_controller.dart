import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import '../repositories/todo_repository.dart';

class TodoController extends StateNotifier<List<Todo>> {
  final TodoRepository repository;
  bool isLoading = false;

  TodoController(this.repository) : super([]);

  Future<void> fetchTodos() async {
    isLoading = true;
    try {
      final todos = await repository.getTodos();
      state = todos;
    } finally {
      isLoading = false;
    }
  }

  void addTodo(String title) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
    );
    state = [...state, newTodo];
    repository.addTodo(title);
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(done: !todo.done);
      }
      return todo;
    }).toList();
  }
}