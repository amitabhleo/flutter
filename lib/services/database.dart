import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_brew_app/models/brew.dart';

class DatabaseService {
  String uid;

  DatabaseService({this.uid});

  //collection reference

  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future updateUserData(
      String sugars, String name, int strength, String photo) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
      'photo': photo
      //'https://firebasestorage.googleapis.com/v0/b/my-family-9ae9d.appspot.com/o/cafes%2Fsemi-cooked.jpg?alt=media&token=8c2122ed-cced-4876-aba1-f6b6b553267a'
    });
  }
  //brewlist from snapshot

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
          name: doc.data['name'],
          strength: doc.data['strength'],
          sugars: doc.data['sugars'],
          photo: doc.data['photo']);
    }).toList();
  }

  //get stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
