import 'package:flutter/material.dart';
import 'package:nectar/models/item_model.dart';

class FavouriteViewModel extends ChangeNotifier {
  final List<ItemModel> _favourites = [];

  bool get isEmpty => _favourites.isEmpty;
  int get length => _favourites.length;
  List<ItemModel> get favourite => List.unmodifiable(_favourites);

  void addToFavourites(ItemModel favouriteItem) {
    _favourites.add(favouriteItem);
    notifyListeners();
  }

  void removeFromFavourites(int favouriteItemindex) {
    _favourites.removeAt(favouriteItemindex);
    notifyListeners();
  }
}

