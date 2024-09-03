import 'package:flutter/material.dart';

class WrapperViewmodel extends ChangeNotifier {
  bool changeview = false;

  void onChange() {
    changeview = true;
    notifyListeners();
  }
}