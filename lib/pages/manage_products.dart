import 'package:flutter/material.dart';

import 'package:myapp/pages/product_create.dart';
import 'package:myapp/pages/product_list.dart';
import './products.dart';

class ManageProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  title: Text('Choose'),
                ),
                ListTile(
                  title: Text('All Products'),
                  onTap: () => Navigator.pushReplacementNamed(context,'/'),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text("Manage Products"),
            bottom: TabBar(tabs: <Widget>[
              Tab(icon: Icon(Icons.create), text: ('Create Product')),
              Tab(icon: Icon(Icons.list), text: ('My Products'))
            ]),
          ),
          body: TabBarView(children: <Widget>[
            ProductCreate(),
            ProductList()
          ])
        ));
  }
}
