import 'dart:core';

class NewPost {
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? text;
  String? postImage;

  NewPost({
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.text,
    this.postImage,
  });

  factory NewPost.fromJson(Map<String, dynamic>? json) {
    return NewPost(
      name: json!['name'],
      uId: json['uId'],
      image: json['image'],
      dateTime: json['dateTime'],
      text: json['text'],
      postImage: json['postImage'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'dateTime': dateTime,
      'text': text,
      'postImage': postImage,
    };
  }
}
