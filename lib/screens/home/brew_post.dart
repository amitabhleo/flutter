import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrewPost extends StatefulWidget {
  @override
  _BrewPostState createState() => _BrewPostState();
}

class _BrewPostState extends State<BrewPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: StreamBuilder(
            stream: Firestore.instance.collection('brews').snapshots(),
            // ignore: missing_return
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                const Text('Loading...');
              } else {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot mypost = snapshot.data.documents[index];
                      return Container(
                        child: Column(
                          children: <Widget>[
                            Image.network(mypost['photo']),
                            Text(
                              '${mypost['name']}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
