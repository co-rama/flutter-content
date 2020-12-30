import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:myapp/widgets/products/product_card.dart';
import 'package:myapp/scoped_models/products.dart';
import 'package:myapp/models/product.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
    Widget productCards =
        Center(child: Text('No Products Found, Please Add some'));
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) => _buildProductList(model.products));
  }
}
