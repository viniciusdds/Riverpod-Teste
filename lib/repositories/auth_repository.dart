import '../models/user.dart';
import '../services/api_service.dart';

class AuthRepository {

  final ApiService api;

  AuthRepository(this.api);

  Future<User> login({
    required String email,
    required String senha,
  }) async {

     final response = await api.dio.post(
       '/login.php',
       data: {
         'email': email,
         'senha': senha
       },
     );

     print(response.data);

    if(response.data['success'] == true){
      return User.fromJson(
        response.data['usuario'],
      );
    }

    throw Exception(
      response.data['message'] ?? 'Erro ao autenticar',
    );
  }
}