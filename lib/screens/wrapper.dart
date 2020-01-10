import 'package:flutter/material.dart';
import 'package:my_brew_app/models/user.dart';
import 'package:my_brew_app/screens/authenticate/authenticate.dart';
import 'package:my_brew_app/screens/home/home.dart';
import 'package:my_brew_app/services/auth.dart';
import 'package:provider/provider.dart';
//import 'package:mybrew_crew/screens/authenticate/authenticate.dart';

//import 'package:mybrew_crew/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    //this will either return home or authenticate
    if (user == null){

      return Authenticate();
    }
    else{
      return Home();
    }

  }
}
