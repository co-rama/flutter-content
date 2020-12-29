import 'package:flutter/material.dart';
import 'package:myapp/pages/product_edit.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  ProductList(this.products, this.updateProduct);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Image.asset(products[index]['image']),
              title: Text(products[index]['title']),
              trailing: IconButton(
                  icon: new Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ProductEditPage(
                        product: products[index],
                        updateProduct: updateProduct,
                        productIndex: index,
                      );
                    }));
                  }),
            ),
          );
        },
        itemCount: products.length);
  }
}
