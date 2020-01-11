import 'package:flutter/material.dart';
import 'package:my_brew_app/screens/authenticate/signin_email.dart';
import 'package:my_brew_app/services/auth.dart';

class Register extends StatefulWidget {


  final Function togView;
  Register({this.togView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Sign up to Brew Crew'),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            widget.togView();
          },
              icon: Icon(Icons.person),
              label: Text('Signin '))
        ],

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                  onChanged: (val){
                    setState(() => email = val);
                  }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  validator: (val) => val.length < 5 ? 'Enter a password > 5 chars long' : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() => password = val);
                  }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text('Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                if(_formKey.currentState.validate()){
                  dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                  if (result == null){

                    setState(() => error = 'enter a valid email');
                  }
                }
                },
              ),
              SizedBox(height: 12.0),
              Text(error,
                style: TextStyle(
                color: Colors.red
              ),)

            ],
          ),
        ),
      ),
    );
  }
}
