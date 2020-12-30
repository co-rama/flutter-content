import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/scoped_models/main.dart';
import 'package:myapp/widgets/ui_elements/address_tag.dart';

import 'package:myapp/widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;
  ProductPage(this.productIndex);

  _showWarningDialog(BuildContext context) {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are you sure"),
            content: Text('These action can not be undone'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('DISCARD')),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
                child: Text('CONTINUE'),
              ),
            ],
          );
        },
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      // print('back Button Pressed');
      Navigator.pop(context, false);
      return Future.value(false);
    }, child: ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        final Product product = model.products[productIndex];
        return Scaffold(
          appBar: AppBar(
            title: Text(product.title),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(product.image),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TitleDefault(product.title),
                ),
                AddressTag(),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () => _showWarningDialog(context),
                    child: Text('DELETE'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
