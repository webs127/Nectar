import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  double initPrice = 0.0;
  void increasePrice(double value) {
    initPrice = value;
    notifyListeners();
}
}