import 'package:flutter/material.dart';
import 'package:my_brew_app/services/auth.dart';

class Home extends StatelessWidget {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('My Brew App'),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(onPressed: () async{
            await _auth.signingOut();
          },
              icon: Icon(Icons.person),
              label: Text('signout'))
        ],
      ),
    );

  }
}
