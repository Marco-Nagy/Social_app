import 'dart:core';

class UserData {
  String? email;
  String? name;
  String? phone;
  String? uId;
  String? image;
  String? cover;
  String? bio;
  bool? isEmailVerified;

  UserData({
    this.phone,
    this.email,
    this.name,
    this.uId,
    this.image,
    this.cover,
    this.bio,
    this.isEmailVerified,
  });

  factory UserData.fromJson(Map<String, dynamic>? json) {
    return UserData(
      email: json!['email'],
      name: json['name'],
      phone: json['phone'],
      uId: json['uId'],
      image: json['image'],
      cover: json['cover'],
      bio: json['bio'],
      isEmailVerified: json['isEmailVerified'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'uId': uId,
      'image': image,
      'cover': cover,
      'bio': bio,
      'isEmailVerified': isEmailVerified,
    };
  }
}
