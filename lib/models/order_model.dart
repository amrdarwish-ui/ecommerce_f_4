import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ecommerce1/models/cart_pruduct_model.dart';

class OrderModel {
  String deliveryType;
  String address;
  bool isDelverd;
  List<CartPruductModel> prudcts;
  String userId;
  OrderModel({
    required this.deliveryType,
    required this.address,
    required this.isDelverd,
    required this.prudcts,
    required this.userId,
  });

  OrderModel copyWith({
    String? deliveryType,
    String? address,
    bool? isDelverd,
    List<CartPruductModel>? prudcts,
    String? userId,
  }) {
    return OrderModel(
      deliveryType: deliveryType ?? this.deliveryType,
      address: address ?? this.address,
      isDelverd: isDelverd ?? this.isDelverd,
      prudcts: prudcts ?? this.prudcts,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'deliveryType': deliveryType,
      'address': address,
      'isDelverd': isDelverd,
      'prudcts': prudcts.map((x) => x.toMap()).toList(),
      'userId': userId,
    };
  }

  factory OrderModel.fromMap(map) {
    return OrderModel(
      deliveryType: map['deliveryType'] ?? '',
      address: map['address'] ?? '',
      isDelverd: map['isDelverd'] ?? false,
      prudcts: List<CartPruductModel>.from(
          map['prudcts']?.map((x) => CartPruductModel.fromMap(x))),
      userId: map['userId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(deliveryType: $deliveryType, address: $address, isDelverd: $isDelverd, prudcts: $prudcts, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        other.deliveryType == deliveryType &&
        other.address == address &&
        other.isDelverd == isDelverd &&
        listEquals(other.prudcts, prudcts) &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return deliveryType.hashCode ^
        address.hashCode ^
        isDelverd.hashCode ^
        prudcts.hashCode ^
        userId.hashCode;
  }
}
