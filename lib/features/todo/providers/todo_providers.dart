import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/core_providers.dart';
import '../controllers/todo_controller.dart';
import '../models/todo.dart';
import '../repositories/todo_repository.dart';

// Repository
final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return TodoRepository(dio);
});

// Controller
final todoControllerProvider = StateNotifierProvider<TodoController, List<Todo>>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return TodoController(repository);
});