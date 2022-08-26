import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWid extends StatelessWidget {
  const SearchWid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 49 / 812,
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.03),
          borderRadius: BorderRadius.circular(45)),
      child: const Icon(Icons.search),
      alignment: Alignment.centerLeft,
    );
  }
}
