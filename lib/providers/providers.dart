import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meu_app_riverpod/repositories/product_repository.dart';


final productRepositoryProvider = Provider<ProductRepository>((ref){
  return ProductRepository();
});

// final cartProvider = StateProvider<int>((ref){
//   return 0;
// });