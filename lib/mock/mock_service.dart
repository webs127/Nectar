import 'package:flutter/material.dart';
import 'package:nectar/models/item_model.dart';

class MockService with ChangeNotifier {

  static final Map<String, dynamic> _allfruits= {
    "exclusive offer": _items,
    "best selling": _bestselling
  };

  static final List<ItemModel> _items = [
    ItemModel(
        name: "Banana",
        price: 1.99,
        quantity: 1,
        weight: "7pcs per bunch",
        imageUrl: "assets/images/banana.jpg"),
    ItemModel(
        name: "Apple",
        price: 5.99,
        quantity: 1,
        weight: "1kg per one",
        imageUrl: "assets/images/apple.png"),
    ItemModel(
        name: "Orange",
        price: 10.99,
        quantity: 1,
        weight: "1pcs per one",
        imageUrl: "assets/images/orange.jpg"),
    ItemModel(
        name: "PineApple",
        price: 21.99,
        quantity: 1,
        weight: "3kg per one",
        imageUrl: "assets/images/pineapple.jpg",),
    ItemModel(
        name: "Strawberry",
        price: 11.99,
        quantity: 1,
        weight: "10pcs per bunch",
        imageUrl: "assets/images/strawberry.jpg"),
  ];
  static final List<ItemModel> _bestselling = [
    ItemModel(
        name: "Banana Bunch",
        price: 7.99,
        quantity: 1,
        weight: "7pcs per bunch",
        imageUrl: "assets/images/banana.jpg"),
    ItemModel(
        name: "Apple Bunch",
        price: 19.99,
        quantity: 1,
        weight: "1kg per one",
        imageUrl: "assets/images/apple.png"),
    ItemModel(
        name: "Orange Bunch",
        price: 18.99,
        quantity: 1,
        weight: "1pcs per one",
        imageUrl: "assets/images/orange.jpg"),
    ItemModel(
        name: "PineApple Bunch",
        price: 38.99,
        quantity: 1,
        weight: "3kg per one",
        imageUrl: "assets/images/pineapple.jpg",),
    ItemModel(
        name: "Strawberry Bunch",
        price: 22.99,
        quantity: 1,
        weight: "10pcs per bunch",
        imageUrl: "assets/images/strawberry.jpg"),
  ];
  static final List<ItemModel> _softDrinks = [
    ItemModel(
        name: "Sprite",
        price: 7.99,
        quantity: 1,
        weight: "325ml",
        imageUrl: "assets/images/pngfuel_1.png"),
    ItemModel(
        name: "Coke Diet",
        price: 19.99,
        quantity: 1,
        weight: "325ml",
        imageUrl: "assets/images/pngfuel_2.png"),
    ItemModel(
        name: "Coke Classic",
        price: 18.99,
        quantity: 1,
        weight: "300",
        imageUrl: "assets/images/pngfuel_3.png"),
    ItemModel(
        name: "Tomato Juice",
        price: 18.99,
        quantity: 1,
        weight: "200ml",
        imageUrl: "assets/images/pngfuel_4.png",),
    ItemModel(
        name: "Pepsi",
        price: 12.99,
        quantity: 1,
        weight: "300ml",
        imageUrl: "assets/images/pngfuel_5.png"),
  ];
  static final List<ExploreItemModel> _explore = [
    ExploreItemModel(name: "Fruits & Vegetables", items: _items),
    ExploreItemModel(name: "Beverages", items: _softDrinks),
    ExploreItemModel(name: "Soft Drinks", items: _items),
    ExploreItemModel(name: "Alcohol", items: _items),
    ExploreItemModel(name: "Fishes", items: _items),
    ExploreItemModel(name: "Beefs", items: _items),
  ];

  static Future<Map<String, dynamic>> getAllFruits() {
    Future<Map<String, dynamic>> allfruitList =
        Future.delayed(const Duration(seconds: 1), () {
      return _allfruits;
    });
    return Future.value(allfruitList);
  }

  static Future<List<ExploreItemModel>> explore() {
    Future<List<ExploreItemModel>> exploreList =
        Future.delayed(const Duration(seconds: 1), () {
      return _explore;
    });
    return Future.value(exploreList);
  }

  
  // static Future<List<ItemModel>> bestSelling() {
  //   Future<List<ItemModel>> bestSellingList =
  //       Future.delayed(const Duration(seconds: 2), () {
  //     return _bestselling;
  //   });
  //   return Future.value(bestSellingList);
  // }
}

class ExploreItemModel {
  final String name;
  final List<ItemModel> items;

  ExploreItemModel({required this.name, required this.items});

  @override
  String toString() => "name: $name items: $items";
}
