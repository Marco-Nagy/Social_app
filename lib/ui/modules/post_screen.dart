import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Post',
          style: TextStyle(
            fontFamily: 'jannah',
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),),
      ),
    );
  }
}
