import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_brew_app/models/brew.dart';

class DatabaseService{

  String uid;

  DatabaseService({this.uid});

  //collection reference

  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future updateUserData(String sugars,String name, int strength) async{

    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name' : name,
      'strength': strength
    });
  }
  //brewlist from snapshot

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){

    return   snapshot.documents.map((doc){

        return Brew(
          name: doc.data['name'],
          strength: doc.data['strength'],
          sugars: doc.data['sugars']

          );
      }).toList();
  }


  //get stream
  Stream<List<Brew>> get brews {

    return brewCollection.snapshots()
        .map(_brewListFromSnapshot);
  }
}

