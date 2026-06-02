import '../models/product.dart';

class ProductRepository {
  List<Product> getProducts(){
    return [
      Product(id: 1, nome: 'Notebook', preco: 5500),
      Product(id: 2, nome: 'Mouse', preco: 8.50),
      Product(id: 3, nome: 'Teclado', preco:  460.90)
    ];
  }
}