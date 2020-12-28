import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[900], width: 1.0),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text('Sanamu Ya Jeshi, Posta Dsm')),
    );
  }
}
