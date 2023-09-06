import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? image;
  String id;
  String name;
  String email;

  UserModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }
  Map<String, dynamic> toJson() =>
      {'image': image, 'id': id, 'name': name, 'email': email};

  UserModel copywith({String? name, String? image}) => UserModel(
      email: email,
      id: id,
      name: name ?? this.name,
      image: image ?? this.image);
}
