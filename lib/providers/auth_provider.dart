import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  // shared preferences
  late SharedPreferences _sharedPreferences;

  void init() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    // check if user is authenticated
    _isAuthenticated = _sharedPreferences.getBool('isAuthenticated') ?? false;
    notifyListeners();
  }

  void login() async {
    await _sharedPreferences.setBool('isAuthenticated', true);
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() async {
    await _sharedPreferences.setBool('isAuthenticated', false);
    _isAuthenticated = false;
    notifyListeners();
  }
}
