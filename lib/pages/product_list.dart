import 'package:flutter/material.dart';

import 'package:myapp/models/product.dart';
import 'package:myapp/pages/product_edit.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  final Function updateProduct;
  final Function deleteProduct;
  ProductList(this.products, this.updateProduct, this.deleteProduct);

  Widget buildEditIcon(BuildContext context, int index) {
    return IconButton(
        icon: new Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return ProductEditPage(
              product: products[index],
              updateProduct: updateProduct,
              productIndex: index,
            );
          }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Dismissible(
              background: Container(color: Colors.red),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  deleteProduct(index);
                }
              },
              // confirmDismiss: (DismissDirection direction) {
              //   if (direction == DismissDirection.endToStart) {
              //     return true;
              //   }
              //   return false;
              // },
              key: Key(products[index].title),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(products[index].image),
                    ),
                    title: Text(products[index].title),
                    subtitle: Text('\$' + products[index].price.toString()),
                    trailing: buildEditIcon(context, index),
                  ),
                  Divider(),
                ],
              ),
            ),
          );
        },
        itemCount: products.length);
  }
}
