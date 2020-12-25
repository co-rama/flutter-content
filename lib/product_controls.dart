import 'package:flutter/material.dart';

class ProductControls extends StatelessWidget {
  final Function addProduct;
  ProductControls(this.addProduct);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Theme.of(context).primaryColor,
        onPressed: () {
          addProduct('Sweets');
        },
        child: Text('Press Me'),);
  }
}
