import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_brew_app/screens/authenticate/signin_email.dart';
import 'package:my_brew_app/services/auth.dart';
import 'package:image_picker/image_picker.dart';

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
  File _image;

  @override
  Widget build(BuildContext context) {
    Future uploadPic(BuildContext context) {
      File imgFile = _image;
      // Create a reference to "mountains.jpg"
      //StorageReference myCameraPic = storageRef.child("mountains.jpg");
      StorageUploadTask firebaseUploadTask =
          FirebaseStorage.instance.ref().child("images/").putFile(imgFile);
      // Continue with the task to get the download URL
      //return firebaseUploadTask.getDownloadUrl();
      if (firebaseUploadTask.isSuccessful) {
        print('file uploaded successfully');
      } else {
        print('else statement on firebaseupload task');
      }
    }

    //uploading image to Firestore
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
      uploadPic(context);
    }

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Sign up to Brew Crew'),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.togView();
              },
              icon: Icon(Icons.person),
              label: Text('Signin '))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0)),
                  ),
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0)),
                  ),
                  validator: (val) =>
                      val.length < 5 ? 'Enter a password > 5 chars long' : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.red[400],
                child:
                    Text('Take Photo', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  getImage();
                },
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() => error = 'enter a valid email');
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
