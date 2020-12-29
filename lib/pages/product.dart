import 'package:flutter/material.dart';
import 'package:myapp/widgets/ui_elements/address_tag.dart';

import 'package:myapp/widgets/ui_elements/title_default.dart';


class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  ProductPage(this.title, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are you sure"),
            content: Text('These action can not be undone'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('DISCARD')),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
                child: Text('CONTINUE'),
              ),
            ],
          );
        },
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // print('back Button Pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TitleDefault(title),
              ),
              AddressTag(),
              Container(
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () => _showWarningDialog(context),
                  child: Text('DELETE'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
