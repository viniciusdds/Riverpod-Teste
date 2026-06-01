class ProductRepository {

  Future<List<String>> getProducts() async {

    await Future.delayed(
      const Duration(seconds: 2)
    );

    return [
      'Notebook',
      'Mouse',
      'Teclado',
    ];
  }
}