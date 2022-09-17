import 'package:flutter/material.dart';

// simple value change
final counter = ValueNotifier(0);

class AppConfigProvider with ChangeNotifier {
  String _appName = "Demo"; // "New App Name"

  String get appName => _appName;

  void setNewApp(String newValue) {
    _appName = newValue;
    notifyListeners();
  }
}

class SimpleMode {
  String simple = "simple";
}
