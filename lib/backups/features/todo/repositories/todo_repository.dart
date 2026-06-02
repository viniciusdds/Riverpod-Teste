import 'package:dio/dio.dart';
import '../models/todo.dart';

class TodoRepository {
  final Dio dio;

  TodoRepository(this.dio);

  Future<List<Todo>> getTodos() async {
    final response = await dio.get('https://viacep.com.br/ws/01001000/json/');
    final List data = response.data;

    return data.map((json) {

      print("Resultado: "+json['cep']);

      return Todo(
        id: json['id'].toString(),
        title: json['title'] ?? '',
        done: json['done'] ?? false,
      );
    }
    ).toList();


  }

  Future<void> addTodo(String title) async {
    await dio.post('/todos', data: {'title': title});
  }
}