import 'package:myapp/models/user.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:myapp/models/product.dart';

mixin ProductsModel on Model {
  List<Product> _products = [];
  int _selectedProductIndex;
  bool _showfavorites = false;
  User authenticatedUser;

  void addProduct(
      {String title, String description, String image, double price}) {
    Product product = new Product(
      title: title,
      description: description,
      image: image,
      price: price,
      userEmail: authenticatedUser.email,
      userID: authenticatedUser.password,
    );
    _products.add(product);
    // _selectedProductIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    if (_selectedProductIndex != null) {
      _products.removeAt(_selectedProductIndex);
    }
    // _selectedProductIndex = null;
    notifyListeners();
  }

  void updateProduct( {String title, String description, String image, double price}) {
    Product product = new Product(
      title: title,
      description: description,
      image: image,
      price: price,
      userEmail: authenticatedUser.email,
      userID: authenticatedUser.id
    );
    if (_selectedProductIndex != null) {
      _products[_selectedProductIndex] = product;
    }
    // _selectedProductIndex = null;
    notifyListeners();
  }

  void selectProductIndex(int index) {
    _selectedProductIndex = index;
    notifyListeners();
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite =
        _products[_selectedProductIndex].isFavorite;
    final bool newFavorite = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      image: selectedProduct.image,
      price: selectedProduct.price,
      isFavorite: newFavorite,
      userEmail: authenticatedUser.email,
      userID: authenticatedUser.id,
    );
    _products[_selectedProductIndex] = updatedProduct;
    // _selectedProductIndex = null;
    notifyListeners();
  }

  void toggleDisplayFavorite() {
    _showfavorites = !_showfavorites;
    notifyListeners();
  }

  List<Product> get products {
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }

  Product get selectedProduct {
    if (_selectedProductIndex == null) {
      return null;
    }
    return _products[_selectedProductIndex];
  }

  List<Product> get displayedProducts {
    if (_showfavorites) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }

  bool get displayFavoritesOnly {
    return _showfavorites;
  }
}
