import 'dart:core';

class MessageModel {
  String? senderId;
  String? receiverId;
  String? dateTime;
  String? text;
  //String? image;


  MessageModel({
    this.dateTime,
    this.senderId,
    this.receiverId,
    this.text,
    //this.image,

  });

  factory MessageModel.fromJson(Map<String, dynamic>? json) {
    return MessageModel(
      senderId: json!['senderId'],
      receiverId: json['receiverId'],
      dateTime: json['dateTime'],
      text: json['text'],
      //image: json['image'],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'dateTime': dateTime,
      'text': text,
      //'image': image,
    };
  }
}
