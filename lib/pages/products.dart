import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';

import 'package:myapp/scoped_models/main.dart';
import 'package:myapp/widgets/products/product_card.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductsPage extends StatelessWidget {
  Widget buildProductList(List<Product> products) {
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
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage Products'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/admin');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('PRODUCTS LIST'),
        actions: <Widget>[
          ScopedModelDescendant<MainModel>(builder:
              (BuildContext context, Widget child, MainModel model) {
            return IconButton(
                icon: Icon(model.displayFavoritesOnly ? Icons.favorite :  Icons.favorite_outline),
                onPressed: () {
                  model.toggleDisplayFavorite();
                });
          }),
        ],
      ),
      body: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) =>
              buildProductList(model.displayedProducts)),
    );
  }
}
