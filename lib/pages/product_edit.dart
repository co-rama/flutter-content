import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductEditPage extends StatefulWidget {
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

  Widget _buildTitleTextField(Product product) {
    return TextFormField(
      initialValue: product == null ? '' : product.title,
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

  Widget _buildDescriptionTextField(Product product) {
    return TextFormField(
      initialValue: product == null ? '' : product.description,
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

  Widget _buldPriceTextField(Product product) {
    return TextFormField(
      initialValue: product == null ? '' : product.price.toString(),
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

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return RaisedButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: () => _submitForm(model.addProduct, model.updateProduct,
            model.selectProductIndex, model.selectedProductIndex),
        child: Text('Save'),
      );
    });
  }

  void _submitForm(
      Function addProduct, Function updateProduct, Function setSelectedProduct,
      [int selectedProductIndex]) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    // final Product product = new Product(
    //     title: _formData['title'],
    //     description: _formData['description'],
    //     price: _formData['price'],
    //     image: 'assets/xmass.jpg',
    //     userEmail: null,
    //     userID: null,
    //     );
    if (selectedProductIndex != null) {
      updateProduct(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          image: 'assets/xmass.jpg');
    } else {
      addProduct(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          image: 'assets/xmass.jpg');
    }
    Navigator.pushReplacementNamed(context, '/products')
        .then((value) => setSelectedProduct(null));
  }

  @override
  Widget build(BuildContext context) {
    Widget buildPageContent(BuildContext context, Product product) {
      final double deviceWidth = MediaQuery.of(context).size.width;
      final double targetWidth =
          deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
      final double targetPadding = deviceWidth - targetWidth;
      return GestureDetector(
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
                _buildTitleTextField(product),
                _buildDescriptionTextField(product),
                _buldPriceTextField(product),
                SizedBox(
                  height: 10.0,
                ),
                _buildSubmitButton(),
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
    }
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

    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      final Widget pageContent =
          buildPageContent(context, model.selectedProduct);
      return model.selectedProduct == null
          ? pageContent
          : Scaffold(
              appBar: AppBar(
                title: Text('Edit Product'),
              ),
              body: pageContent,
            );
    });
  }
}
