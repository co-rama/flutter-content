import 'package:flutter/material.dart';

import './products.dart';
import './product_controls.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;
  ProductManager({this.startingProduct});
  @override
  State<StatefulWidget> createState() {
    return _ProductManager();
  }
}

class _ProductManager extends State<ProductManager> {
  List<String> _products = [];
  @override
  void initState() {
    if(widget.startingProduct != null){
      _products.add(widget.startingProduct);
    }
    super.initState();
  }

  void _addProduct(String product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductControls(_addProduct),
      ),
      Expanded(
        child: Products(_products))
    ]);
  }
}
