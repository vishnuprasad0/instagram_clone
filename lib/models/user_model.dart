import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String email;
  final String uid;
  final String bio;
  final String photoUrl;
  final List followers;
  final List following;

  User(
      {required this.username,
      required this.email,
      required this.uid,
      required this.bio,
      required this.photoUrl,
      required this.followers,
      required this.following});

  // func helps to get userdatails for function getUserDetails() dont needed to pass snapshot..... everywhere

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        username: snapshot['username'],
        email: snapshot['email'],
        uid: snapshot['uid'],
        bio: snapshot['bio'],
        photoUrl: snapshot['photoUrl'],
        followers: snapshot['followers'],
        following: snapshot['following']);
  }

  Map<String, dynamic> tojson() => {
        'username': username,
        'uid': uid,
        "email": email,
        "bio": bio,
        'followers': [],
        'following': [],
        'photoUrl': photoUrl,
      };
}
