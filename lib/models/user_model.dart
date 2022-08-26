import 'dart:convert';

class UserModel {
  String name;
  String id;
  String pasword;
  String email;
  UserModel({
    required this.name,
    required this.id,
    required this.pasword,
    required this.email,
  });

  UserModel copyWith({
    String? name,
    String? id,
    String? pasword,
    String? email,
  }) {
    return UserModel(
      name: name ?? this.name,
      id: id ?? this.id,
      pasword: pasword ?? this.pasword,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'pasword': pasword,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      pasword: map['pasword'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, id: $id, pasword: $pasword, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.id == id &&
        other.pasword == pasword &&
        other.email == email;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode ^ pasword.hashCode ^ email.hashCode;
  }
}
