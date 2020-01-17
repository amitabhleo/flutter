//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_brew_app/models/brew.dart';

class BrewTile extends StatelessWidget {

  final Brew brew;
  //constructor returning Brew Object
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.strength],
            ),
          title: Text(brew.name),
          subtitle: Text('takes ${brew.sugars} sugar'),
        ),
      ),
    );
  }
}
