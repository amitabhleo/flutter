import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_brew_app/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
    //create user based on firebaseuser
    User _userFromFirebaseuser (FirebaseUser user ){

      return user != null ? User(uid: user.uid) : null;

        }

        //auth change user stream
  Stream<User> get user{
      return _auth.onAuthStateChanged
          .map((FirebaseUser user) => _userFromFirebaseuser(user));
        //.map(_userFromFirebaseuser(user));
  }

  //sign in anony
    Future signInAnon() async{
    try{
        AuthResult result = await _auth.signInAnonymously();
        FirebaseUser user = result.user;
        //return user;
      return _userFromFirebaseuser(user);
    }catch(e){
        print(e.toString());
        return null;
    }

  }

  //sign in with email and password

  // register with email and password

  Future registerWithEmailAndPassword(String email, String password) async{
      try{
        AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        return _userFromFirebaseuser(user);
      }catch(e){
      print(e.toString());
      return null;

      }
  }

  //sign out
Future signingOut() async{
      try{
      return await _auth.signOut();
      }
      catch(e){
        print(e.toString());
        return null;
      }

}

}