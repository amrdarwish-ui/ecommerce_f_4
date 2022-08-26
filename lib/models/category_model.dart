import 'dart:convert';

class CategoryModel {
  String name;
  String img;
  CategoryModel({
    required this.name,
    required this.img,
  });

  CategoryModel copyWith({
    String? name,
    String? img,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'img': img,
    };
  }

  factory CategoryModel.fromMap(map) {
    return CategoryModel(
      name: map['name'] ?? '',
      img: map['img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoryModel(name: $name, img: $img)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel && other.name == name && other.img == img;
  }

  @override
  int get hashCode => name.hashCode ^ img.hashCode;
}
