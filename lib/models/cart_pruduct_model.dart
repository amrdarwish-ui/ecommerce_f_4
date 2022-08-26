import 'dart:convert';

class CartPruductModel {
  int? id;
  String name;
  String image;
  int price;
  int count;
  CartPruductModel({
    this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.count,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'count': count,
    };
  }

  factory CartPruductModel.fromMap(Map<String, dynamic> map) {
    return CartPruductModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: map['price']?.toInt() ?? 0,
      count: map['count']?.toInt() ?? 0,
    );
  }
}
