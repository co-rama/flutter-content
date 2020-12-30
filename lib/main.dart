import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import 'package:myapp/pages/manage_products.dart';
import 'package:myapp/pages/products.dart';
import 'package:myapp/pages/product.dart';
import 'package:myapp/pages/auth.dart';
import 'package:myapp/models/product.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPrintMouseHoverEvents = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  List<Product> _products = [];
  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  void _updateProduct(int index, Product product) {
    setState(() {
      _products[index] = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corama',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
        // buttonColor: Colors.purple[3000],
        // fontFamily: 'Oswald',
      ),
      home: AuthPage(),
      routes: {
        '/products': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) => ManageProductPage(
            _addProduct, _updateProduct, _deleteProduct, _products)
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index].title, _products[index].image),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(_products));
      },
    );
  }
}
