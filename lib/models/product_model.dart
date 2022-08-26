import 'dart:convert';

class ProductModel {
  String name;
  String brand;
  String color;
  String img;
  int price;
  String category;
  String size;
  String details;
  ProductModel({
    required this.name,
    required this.brand,
    required this.color,
    required this.img,
    required this.price,
    required this.category,
    required this.size,
    required this.details,
  });

  ProductModel copyWith({
    String? name,
    String? brand,
    String? color,
    String? img,
    int? price,
    String? category,
    String? size,
    String? details,
  }) {
    return ProductModel(
      name: name ?? this.name,
      brand: brand ?? this.brand,
      color: color ?? this.color,
      img: img ?? this.img,
      price: price ?? this.price,
      category: category ?? this.category,
      size: size ?? this.size,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'brand': brand,
      'color': color,
      'img': img,
      'price': price,
      'category': category,
      'size': size,
      'details': details,
    };
  }

  factory ProductModel.fromMap(map) {
    return ProductModel(
      name: map['name'] ?? '',
      brand: map['brand'] ?? '',
      color: map['color'] ?? '',
      img: map['img'] ?? '',
      price: map['price']?.toInt() ?? 0,
      category: map['category'] ?? '',
      size: map['size'] ?? '',
      details: map['details'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(name: $name, brand: $brand, color: $color, img: $img, price: $price, category: $category, size: $size, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.name == name &&
        other.brand == brand &&
        other.color == color &&
        other.img == img &&
        other.price == price &&
        other.category == category &&
        other.size == size &&
        other.details == details;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        brand.hashCode ^
        color.hashCode ^
        img.hashCode ^
        price.hashCode ^
        category.hashCode ^
        size.hashCode ^
        details.hashCode;
  }
}
