import 'dart:core';

class UserData {
  String email;
  String name;
  String phone;
  String uId;
  String image;
  String bio;
  bool isEmailVerified;

  UserData({
    required this.phone,
    required this.email,
    required this.name,
    required this.uId,
    required this.image,
    required this.bio,
    required this.isEmailVerified,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      uId: json['uId'],
      image: json['image'],
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
      'isEmailVerified': isEmailVerified,
    };
  }
}
