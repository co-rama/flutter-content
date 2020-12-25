import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './products_manager.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPrintMouseHoverEvents = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Merry Christmas Everyone'),
        ),
        body: ProductManager(),
      ),
    );
  }
}
