import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await Authmethods().getUserDetails();
    _user = user;
    notifyListeners();
  }
}
