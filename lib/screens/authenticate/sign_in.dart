import 'package:flutter/material.dart';
import 'package:my_brew_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  //final AuthService _auth = AuthService();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Sign in to BrewCrew'),
      ),
      body: Container(

        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
        child: RaisedButton(

          child: Text('Sign in Anony'),
          onPressed: () async{
             dynamic result  = await _auth.signInAnon();
             if (result == null){
               print('error sigining in ...');
             }else{
               print('user signed in successfully');
               print(result.uid);
             }
          },
        ),
      ),
      );
  }
}
