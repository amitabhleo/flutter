import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_brew_app/screens/authenticate/register.dart';
import 'package:my_brew_app/services/auth.dart';

class SignInEmail extends StatefulWidget {

  final Function togView;
  SignInEmail({this.togView});

  @override
  _SignInEmailState createState() => _SignInEmailState();
}

class _SignInEmailState extends State<SignInEmail> {
  final AuthService _auth = AuthService();
  //set state
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Signin with Email'),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            widget.togView();

          },
              icon: Icon(Icons.person),
              label: Text('Register'))
        ],
        ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
            SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val){
                  setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
               child: Text('Sign in',
               style: TextStyle(color: Colors.white),
               ),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
