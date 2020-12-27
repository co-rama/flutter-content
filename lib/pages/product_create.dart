import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  final Function addProduct;
  ProductCreate(this.addProduct);
  @override
  State<StatefulWidget> createState() {
    return _ProductCreate();
  }
}

class _ProductCreate extends State<ProductCreate> {
  // _ProductCreate(this.titleValue, this.description, this.price);
  String _titleValue = '';
  String _description = '';
  double _price = 0.00;

  @override
  Widget build(BuildContext context) {
    // return Center(
    //     child: RaisedButton(
    //   onPressed: () {
    //     showModalBottomSheet(
    //         context: context,
    //         builder: (BuildContext context) {
    //           return Center(
    //             child: Text('This is modal'),
    //           );
    //         });
    //   },
    //   child: Text('Save'),
    // ));

    return Container(
      margin: EdgeInsets.all(15.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Product Title'),
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Product Description'),
            maxLines: 4,
            onChanged: (String value) {
              setState(() {
                _description = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Product Price'),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                _price = double.parse(value);
              });
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': _titleValue,
                'description': _description,
                'price': _price,
                'image': 'assets/xmass.jpg'
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, '/products');
            },
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}
