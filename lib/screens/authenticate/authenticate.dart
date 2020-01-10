import 'package:flutter/material.dart';
import 'package:my_brew_app/screens/authenticate/register.dart';
import 'package:my_brew_app/screens/authenticate/sign_in.dart';
import 'package:my_brew_app/screens/authenticate/signin_email.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = false;
  void toggleView(){
    setState(() => !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignInEmail(togView:toggleView);
    }
      return Register(togView: toggleView);
  }
}
