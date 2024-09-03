class ItemModel {
  final String name;
  double price;
  int quantity;
  final String imageUrl;
  final String weight;

  ItemModel(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.imageUrl,
      required this.weight});

  ItemModel copyWith(
          {String? name,
          double? price,
          int? quantity,
          String? imageUrl,
          String? weight}) =>
      ItemModel(
          name: name ?? this.name,
          price: price ?? this.price,
          quantity: quantity ?? this.quantity,
          imageUrl: imageUrl ?? this.imageUrl,
          weight: weight ?? this.weight);

  @override
  String toString() =>
      "name: $name, price: $price, quantity: $quantity, imageUrl: $imageUrl, weight: $weight";
}
