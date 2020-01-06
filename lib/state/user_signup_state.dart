import 'package:demo/data/app_repo.dart';
import 'package:demo/data/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserSignUp with ChangeNotifier {
  User _user;
  Repository _repository;

  bool _isLoading = false;
  bool _isDataLoaded = false;

  UserSignUp(User user) {
    _repository = Repository();
    if (user != null) _isDataLoaded = true;
    _user = user;
  }

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  User get user => _user;

  void signupNewUser(User userData) async {
    _isLoading = true;
    notifyListeners();
    final newUser = await _repository.signUpUser(userData);
    _isLoading = false;
    _isDataLoaded = true;
    user = newUser;
  }

  bool isLoading() => _isLoading;

  bool isDataLoaded() => _isDataLoaded;

  void resetData() {
    _isDataLoaded = false;
    user = User();
  }
}
