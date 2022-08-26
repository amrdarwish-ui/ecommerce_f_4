import 'dart:ui';

import 'package:ecommerce1/helpers/constants.dart';
import 'package:ecommerce1/models/cart_pruduct_model.dart';
import 'package:ecommerce1/models/product_model.dart';
import 'package:ecommerce1/view_model/cart_view_model.dart';
import 'package:ecommerce1/views/home/image_show_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  DetailsView({Key? key, required this.model}) : super(key: key);
  ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 196 / 812,
              width: double.infinity,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(ImageShowView(img: model.img));
                    },
                    child: Hero(
                      tag: 'i',
                      child: SizedBox(
                        width: Get.width,
                        height: Get.height * 196 / 812,
                        child: Image.network(model.img),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      top: Get.height * 98 / 812,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios))),
                  Positioned(
                      right: 0,
                      top: Get.height * 90 / 812,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          height: 50,
                          width: 50,
                          child: const Icon(
                            Icons.star,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    model.name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: Get.height * 40 / 812,
                  width: Get.width * 160 / 375,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [const Text('Size'), Text(model.size)],
                  ),
                ),
                Container(
                  height: Get.height * 40 / 812,
                  width: Get.width * 160 / 375,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Color'),
                      Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(int.parse('0xff${model.color}'))),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'Details',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('''${model.details}'''),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: Get.height * 84 / 812,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Price'.toUpperCase()),
                      Text(
                        '\$${model.price}',
                        style: const TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final cont = Get.put(CartViewModel());
                      final CartPruductModel cartmodel = CartPruductModel(
                          name: model.name,
                          image: model.img,
                          price: model.price,
                          count: 1);
                      await cont.addToCart(cartmodel);
                      cont.getAllToCart();
                    },
                    child: const Text(
                      "ADD",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(Get.width * 146 / 375, Get.height * 50 / 812)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
