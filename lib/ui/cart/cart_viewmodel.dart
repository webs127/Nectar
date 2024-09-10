import 'package:flutter/material.dart';
import 'package:nectar/models/item_model.dart';

class CartViewModel extends ChangeNotifier {
  final List<ItemModel> _cartlist = [];
  int get length => _cartlist.length;
  double value = 0;
  List<ItemModel> get cartlist => List.unmodifiable(_cartlist);
  double get totalPrice {
    double data = 0.0;
    for (var element in _cartlist) {
      data += element.price;
    }
    return data;
  }

  void addToCart(ItemModel item) {
    _cartlist.add(item);
    value = totalPrice;
    notifyListeners();
  }

  void addListToCart(List<ItemModel> itemList) {
    for (var element in itemList) {
      if(!_cartlist.contains(element)) {
        _cartlist.add(element);
      }
    }
    value = totalPrice;
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartlist.removeAt(index);
    value = totalPrice;
    notifyListeners();
  }
}
