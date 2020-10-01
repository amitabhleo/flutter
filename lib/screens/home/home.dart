import 'package:flutter/material.dart';
import 'package:my_brew_app/models/brew.dart';
import 'package:my_brew_app/screens/home/brew_list.dart';
import 'package:my_brew_app/screens/home/brew_post.dart';
import 'package:my_brew_app/services/auth.dart';
import 'package:my_brew_app/services/database.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('My Brew App'),
          backgroundColor: Colors.brown[400],
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signingOut();
                },
                icon: Icon(Icons.person),
                label: Text('signout'))
          ],
        ),
        body:

            //BrewPost(),
            BrewList(),
      ),
    );
  }
}
