import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter/rendering.dart';

import 'package:myapp/scoped_models/main.dart';
import 'package:myapp/pages/manage_products.dart';
import 'package:myapp/pages/products.dart';
import 'package:myapp/pages/product.dart';
import 'package:myapp/pages/auth.dart';

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
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
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
          '/products': (BuildContext context) => ProductsPage(),
          '/admin': (BuildContext context) => ManageProductPage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(index),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage());
        },
      ),
    );
  }
}
