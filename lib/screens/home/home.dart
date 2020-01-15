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
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('He\'d have you all unravel at the'),
                  color: Colors.green[100],

                ),
                Container(
                  child: FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.black,
                      size: 50.0,
                    ),
                    label: Text(''),
                    color: Colors.orangeAccent,),
                ),
                Container(
                  child: FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(
                      Icons.account_box,
                      color: Colors.black,
                      size: 50.0,
                    ),
                    label: Text('F'),
                    color: Colors.greenAccent,),
                ),
                Container(
                  child: FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(
                      Icons.print,
                      color: Colors.black,
                      size: 50.0,
                    ),
                    label: Text('F'),
                    color: Colors.blueAccent,),

                ),
                Container(
                  child: FlatButton.icon(
                      onPressed: (){},
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                        size: 50.0,
                        ),
                      label: Text('F'),
                  color: Colors.yellowAccent,),

                ),
                Container(
                  child: FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(
                      Icons.add_call,
                      color: Colors.black,
                      size: 50.0,
                    ),
                    label: Text('F'),
                    color: Colors.redAccent,),

                ),
                Container(
                  child: FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(
                      Icons.accessibility_new,
                      color: Colors.black,
                      size: 50.0,
                    ),
                    label: Text('F'),
                    color: Colors.cyanAccent,),

                ),
                Container(
                  child: FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(
                      Icons.alarm,
                      color: Colors.black,
                      size: 50.0,
                    ),
                    label: Text('F'),
                    color: Colors.pinkAccent),

                ),
                Container(
                  child: FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(
                      Icons.account_balance_wallet,
                      color: Colors.black,
                      size: 50.0,
                    ),
                    label: Text('F'),
                    color: Colors.purpleAccent,),

                ),
              ],
            ),
          ),
        ],
      )
    );

  }
}
