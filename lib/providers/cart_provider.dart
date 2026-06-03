import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meu_app_riverpod/models/product.dart';

class CartNotifier extends Notifier<List<Product>> {

  @override
  List<Product> build(){
    return [];
  }

  void addProduct(Product product){
    state = [...state, product];
  }

  void removeProduct(Product product){
    final upatedList = [...state];

    final index = upatedList.indexWhere(
        (p) => p.id == product.id,
    );

    if(index != -1){
      upatedList.removeAt(index);
    }

    state = upatedList;
  }

  void clearCart(){
    state = [];
  }
}

final cartProvider = NotifierProvider<CartNotifier, List<Product>>(
    CartNotifier.new
);