import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';

import 'package:myapp/widgets/products/product_card.dart';

class Products extends StatelessWidget {
  final List<Product> products;
  Products(this.products);

  Widget _buildProductList() {
    Widget productCards =
        Center(child: Text('No Products Found, Please Add some'));
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) => ProductCard(products[index], index),
        itemCount: products.length,
      );
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
