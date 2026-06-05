class User{

  final int id;
  final String nome;
  final String token;

  User({
    required this.id,
    required this.nome,
    required this.token
  });

  factory User.fromJson(
    Map<String, dynamic> json,
  ){
    return User(
        id: json['id'],
        nome: json['nome'],
        token: json['token']
    );
  }

}