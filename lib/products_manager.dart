import 'package:flutter/material.dart';

import './products.dart';
import './product_controls.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function addProduct;
  final Function deleteProduct;
  ProductManager(this.products, this.addProduct, this.deleteProduct);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductControls(addProduct),
      ),
      Expanded(child: Products(products, deleteProduct: deleteProduct))
    ],
    );
  }
}