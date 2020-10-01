import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_brew_app/models/user.dart';
import 'package:my_brew_app/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user based on firebaseuser
  User _userFromFirebaseuser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseuser(user));
    //.map(_userFromFirebaseuser(user));
  }

  //sign in anony
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      //return user;
      return _userFromFirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  // register with email and password

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      print(user.uid);
      //create a new document for the user with uid
      await DatabaseService(uid: user.uid).updateUserData(
          '0',
          'New Brew Crew Users',
          80,
          'https://firebasestorage.googleapis.com/v0/b/mountains-f6b32.appspot.com/o/images?alt=media&token=5eb4a7fb-b62a-4ec9-89f0-2d8a67ce525e');
      return _userFromFirebaseuser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signingOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
