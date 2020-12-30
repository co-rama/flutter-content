import 'package:flutter/material.dart';

import 'package:myapp/pages/product_edit.dart';
import 'package:myapp/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductList extends StatelessWidget {
  // final List<Product> products;
  // final Function updateProduct;
  // final Function deleteProduct;
  // ProductList(this.products, this.updateProduct, this.deleteProduct);

  Widget buildEditIcon(BuildContext context, int index, MainModel model) {
    return IconButton(
        icon: new Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            model.selectProductIndex(index);
            return ProductEditPage();
          }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Dismissible(
                background: Container(color: Colors.red),
                onDismissed: (DismissDirection direction) {
                  model.selectProductIndex(index);
                  if (direction == DismissDirection.endToStart) {
                    model.deleteProduct();
                  }
                },
                // confirmDismiss: (DismissDirection direction) {
                //   if (direction == DismissDirection.endToStart) {
                //     return true;
                //   }
                //   return false;
                // },
                key: Key(model.products[index].title),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(model.products[index].image),
                      ),
                      title: Text(model.products[index].title),
                      subtitle:
                          Text('\$' + model.products[index].price.toString()),
                      trailing: buildEditIcon(context, index, model),
                    ),
                    Divider(),
                  ],
                ),
              ),
            );
          },
          itemCount: model.products.length);
    });
  }
}
