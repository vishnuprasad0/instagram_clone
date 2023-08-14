import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class Authmethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//sign up method
  signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "some error occured in signup";
    try {
      if (email.isNotEmpty ||
          username.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          Uint8List != null) {
        //registering with db
        UserCredential usercredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        // add profile pic to storage
        String profilePhotoUrl = await StorageMethods()
            .uploadImageToStorage('profile_pictures', file, false);

        //add user details to db while signup
        await _firestore.collection("users").doc(usercredential.user!.uid).set({
          'username': username,
          'uid': usercredential.user!.uid,
          "email": email,
          "bio": bio,
          'followers': [],
          'following': [],
          'photoUrl': profilePhotoUrl,
        });
        res = "success";
      }
    }
    //validation setup
    on FirebaseAuthException catch (err) {
      if (err.message == 'the email address is badly formatted') {
        res = 'this email is badly formatted';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
