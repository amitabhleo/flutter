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
      //'https://firebasestorage.googleapis.com/v0/b/mountains-f6b32.appspot.com/o/images?alt=media&token=a5c82e7c-c95b-4f15-af79-2d9137624eb5'
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
