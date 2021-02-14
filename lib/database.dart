import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:centroid/models/user.dart';

class Database {
  final CollectionReference usersCollection =
      Firestore.instance.collection("users");

  Future addUser(String name) async {
    return await usersCollection.add({"name": name});
  }

  Future deleteUser(String id) async {
    return await usersCollection.document(id).delete();
  }

  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return User(id: doc.documentID, name: doc.data["name"]);
    }).toList();
  }

  Stream<List<User>> get users {
    return usersCollection.snapshots().map(_userListFromSnapshot);
  }
}
