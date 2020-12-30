import 'package:flutter/material.dart';

import 'package:myapp/models/product.dart';
import 'package:myapp/pages/product_edit.dart';
import 'package:myapp/pages/product_list.dart';

class ManageProductPage extends StatelessWidget {
  ManageProductPage(
      this.addProduct, this.updateProduct, this.deleteProduct, this.products);
  final List<Product> products;
  final Function addProduct;
  final Function deleteProduct;
  final Function updateProduct;

  Widget buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('All Products'),
            onTap: () => Navigator.pushReplacementNamed(context, '/products'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: buildSideDrawer(context),
        appBar: AppBar(
          title: Text("Manage Products"),
          bottom: TabBar(tabs: <Widget>[
            Tab(icon: Icon(Icons.create), text: ('Create Product')),
            Tab(icon: Icon(Icons.list), text: ('My Products'))
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductEditPage(addProduct: addProduct),
            ProductList(products, updateProduct, deleteProduct)
          ],
        ),
      ),
    );
  }
}
