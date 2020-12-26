import 'package:flutter/material.dart';
class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/');
        },
        child: Text("LOGIN"),
      )),
    );
  }
}
