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

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Title'),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
        decoration: InputDecoration(labelText: 'Product Description'),
        maxLines: 4,
        onChanged: (String value) {
          setState(() {
            _description = value;
          });
        });
  }

  Widget _buldPriceTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Price'),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        setState(() {
          _price = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _description,
      'price': _price,
      'image': 'assets/xmass.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
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
      width: targetWidth,
      margin: EdgeInsets.all(15.0),
      // THE LIST VIEW BY DEFAULT OCCUPY THE WHOLE WIDTH 
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
        children: <Widget>[
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buldPriceTextField(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: _submitForm,
              child: Text('Save'))
        ],
      ),
    );
  }
}
