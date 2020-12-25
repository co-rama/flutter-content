import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;
  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
        child: Column(
      children: <Widget>[
        Image.asset('assets/xmass.jpg'),
        Text(products[index])
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget productCard =
        Center(child: Text('No Products Found, Please Add some'));
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }
    return productCard;
  }
}
