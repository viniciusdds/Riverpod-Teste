import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meu_app_riverpod/providers/providers.dart';
import '../providers/cart_provider.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final repository = ref.watch(productRepositoryProvider);

    final products = repository.getProducts();

    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho: ${cart.length} itens'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index){

          final product = products[index];

          return ListTile(
            title: Text(product.nome),
            subtitle: Text(product.preco.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: (){
                      ref.read(cartProvider.notifier).addProduct(product);
                    },
                    icon: Icon(Icons.shopping_cart_checkout)
                ),
                IconButton(
                    onPressed: (){
                       ref.read(cartProvider.notifier).removeProduct(product);
                    },
                    icon: Icon(Icons.remove_circle_outline)
                ),
              ],
            )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(cartProvider.notifier).clearCart();
        },
        child: const Icon(Icons.refresh),

      ),
    );
  }
}
