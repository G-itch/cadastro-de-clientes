class ProductManager extends ChangeNotifier {
  ProductManager() {
    _loadAllProducts();
  }

  late List<Product> allProducts = [];

  late String _search = '';

  List<Product> get filteredProducts {
    final List<Product> filteredProducts = [];
    if (search.isEmpty) {
      filteredProducts.addAll(allProducts);
    } else {
      filteredProducts.addAll(allProducts
          .where((p) => p.name!.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredProducts;
  }

  String get search => _search;
  set search(String value) {
    _search = value;
    notifyListeners();
  }

  Future<void> _loadAllProducts() async {
    final QuerySnapshot snapProducts = await FirebaseFirestore.instance
        .collection('products')
        .where('deleted', isEqualTo: false)
        .get();

    allProducts = snapProducts.docs.map((d) => Product.fromdoc(d)).toList();

    notifyListeners();
  }

  Product? findProductById(String id) {
    try {
      return allProducts.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  void update(Product product) {
    allProducts.removeWhere((p) => p.id == product.id);
    allProducts.add(product);
    notifyListeners();
  }

  void delete(Product product) {
    product.delete();
    allProducts.where((p) => p.id == product.id);
    notifyListeners();
  }
}
