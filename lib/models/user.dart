import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String email;
  String name;
  List<int> favoritesIds;

  User(this.uid, this.email);

  Map<String, dynamic> toMap() => {
    'uid': uid,
    'name': name,
    'email': email,
    'favorites': favoritesIds
  };

  User.fromSnapshot(DocumentSnapshot snapshot)
      : uid = snapshot['uid'] ?? "",
        name = snapshot['name'] ?? "",
        email = snapshot['email'] ?? "",
        favoritesIds = snapshot['favorites'] ?? List<int>();
}