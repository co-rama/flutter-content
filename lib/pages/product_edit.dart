import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Product product;
  final int productIndex;
  ProductEditPage(
      {this.addProduct, this.product, this.updateProduct, this.productIndex});
  @override
  State<StatefulWidget> createState() {
    return _ProductEditPage();
  }
}

class _ProductEditPage extends State<ProductEditPage> {
  // _ProductCreate(this.titleValue, this.description, this.price);
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null
  };
  // String _titleValue = '';
  // String _description = '';
  // double _price = 0.00;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      initialValue: widget.product == null ? '' : widget.product.title,
      decoration: InputDecoration(labelText: 'Product Title'),
      // onChanged: (String value) {
      //   setState(() {
      //     _titleValue = value;
      //   });
      // },
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'Title is required and should be 5+ long';
        }
        return null;
      },
      onSaved: (String value) {
        // setState(() {
        _formData['title'] = value;
        // });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      initialValue: widget.product == null ? '' : widget.product.description,
      decoration: InputDecoration(labelText: 'Product Description'),
      maxLines: 4,
      // onChanged: (String value) {
      //   setState(() {
      //     _description = value;
      //   });
      // },
      onSaved: (String value) {
        // setState(() {
        _formData['description'] = value;
        // });
      },
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return 'Description is required and should be 10+ long';
        }
        return null;
      },
    );
  }

  Widget _buldPriceTextField() {
    return TextFormField(
      initialValue:
          widget.product == null ? '' : widget.product.price.toString(),
      decoration: InputDecoration(labelText: 'Product Price'),
      keyboardType: TextInputType.number,
      // onChanged: (String value) {
      //   setState(() {
      //     _price = double.parse(value);
      //   });
      // },
      onSaved: (String value) {
        // setState(() {
        _formData['price'] = double.parse(value);
        // });
      },
      validator: (String value) {
        // RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$')
        if (value.isEmpty ||
            // ignore: valid_regexps
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and should be a number';
        }
        return null;
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    final Product product = new Product(
        title: _formData['title'],
        description: _formData['description'],
        price: _formData['price'],
        image: 'assets/xmass.jpg');
    if (widget.product != null) {
      widget.updateProduct(widget.productIndex, product);
    } else {
      widget.addProduct(product);
    }
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    final Widget pageContent = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        width: targetWidth,
        margin: EdgeInsets.all(15.0),
        // THE LIST VIEW BY DEFAULT OCCUPY THE WHOLE WIDTH
        child: Form(
          key: _formKey,
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
                child: Text('Save'),
              )
              // GestureDetector(
              //   onTap: _submitForm,
              //   child:Container(
              //   // color: ,
              //   padding: EdgeInsets.all(5.0),
              //   child: Text('Pro Save'),
              //   color: Colors.red,
              // )
              // ),
            ],
          ),
        ),
      ),
    );

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

    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Product'),
            ),
            body: pageContent,
          );
  }
}
