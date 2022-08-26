import 'package:flutter/material.dart';

class ImageShowView extends StatelessWidget {
  const ImageShowView({Key? key, required this.img}) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Hero(tag: 'i', child: Image.network(img))),
    );
  }
}
