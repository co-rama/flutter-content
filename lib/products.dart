import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
        child: Column(
      children: <Widget>[
        Image.asset(products[index]['image']),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              products[index]['title'],
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(50.0)),
              child: Text(
                '\$' + products[index]['price'].toString(),
                style: TextStyle(color: Colors.white),
              ),
            )
          ]),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[900], width: 1.0), borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child:Text('Sanamu Ya Jeshi, Posta Dsm')),
        ),
        ButtonBar(
          alignment: (MainAxisAlignment.center),
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed<bool>(
                      context, '/product/' + index.toString());
                },
                child: Text('DETAILS'))
          ],
        )
      ],
    ));
  }

  Widget _buildProductList() {
    Widget productCard =
        Center(child: Text('No Products Found, Please Add some'));
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
