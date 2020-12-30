import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/scoped_models/main.dart';

import 'package:myapp/widgets/products/price_tag.dart';
import 'package:myapp/widgets/ui_elements/title_default.dart';
import 'package:myapp/widgets/ui_elements/address_tag.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final productIndex;
  ProductCard(this.product, this.productIndex);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(width: 10.0),
              TitleDefault(product.title),
              PriceTag(product.price.toString()),
            ]),
          ),
          AddressTag(),
          Text(product.userEmail),
          ButtonBar(
            alignment: (MainAxisAlignment.center),
            children: <Widget>[
              IconButton(
                color: Theme.of(context).accentColor,
                icon: Icon(Icons.info),
                onPressed: () {
                  Navigator.pushNamed<bool>(
                      context, '/product/' + productIndex.toString());
                },
                // child: Text('DETAILS'))
              ),
              ScopedModelDescendant<MainModel>(builder:
                  (BuildContext context, Widget child, MainModel model) {
                return IconButton(
                  icon: Icon(model.products[productIndex].isFavorite ? Icons.favorite : Icons.favorite_outline),
                  color: Colors.red,
                  onPressed: () {
                    model.selectProductIndex(productIndex);
                    model.toggleProductFavoriteStatus();
                  },
                  // child: Text('DETAILS'))
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}
