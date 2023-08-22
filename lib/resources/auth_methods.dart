import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/user_model.dart' as model;
import 'package:instagram_clone/resources/storage_methods.dart';

class Authmethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// function to help refresh function in provider to feed userdata of authenticated current user
  Future<model.User> getUserDetails() async {
    User currentuser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentuser.uid).get();

    return model.User.fromSnap(snap);
  }

//sign up method
  signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    Uint8List? file,
  }) async {
    String res = "some error occured in signup";
    try {
      if (email.isNotEmpty ||
          username.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        //registering with db
        UserCredential usercredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        // add profile pic to storage
        String profilePhotoUrl = await StorageMethods()
            .uploadImageToStorage('profile_pictures', file!, false,username);

        model.User user = model.User(
            username: username,
            email: email,
            uid: usercredential.user!.uid,
            bio: bio,
            photoUrl: profilePhotoUrl,
            followers: [],
            following: []);
        //add user details to db while signup
        await _firestore
            .collection("users")
            .doc(usercredential.user!.uid)
            .set(user.tojson());
        res = "success";
      }
    } catch (err) {
      res = err
          .toString()
          .replaceAllMapped(RegExp(r'[\[\]\_\/]'), (_) => '')
          .replaceAll('auth', '')
          .replaceAll('firebase', '');
    }
    return res;
  }

  //login user

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = 'please enter all fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  
//signout
Future<void> signOut() async {
    await _auth.signOut();
  }
}
