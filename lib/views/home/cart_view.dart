// ignore_for_file: annotate_overrides

import 'package:ecommerce1/helpers/constants.dart';
import 'package:ecommerce1/view_model/cart_view_model.dart';
import 'package:ecommerce1/views/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetWidget<CartViewModel> {
  CartView({Key? key}) : super(key: key);
  final controller = Get.put(CartViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<CartViewModel>(
      builder: (cont) => Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.height,
            child: controller.cartPruducts.isEmpty
                ? Center(
                    child: Text('The cart is empty'),
                  )
                : ListView.builder(
                    itemCount: controller.cartPruducts.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) {
                          controller.delete(controller.cartPruducts[index].id!);
                        },
                        background: Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          child: const Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.white,
                          ),
                        ),
                        child: SizedBox(
                          height: Get.height * 120 / 812,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20),
                                      height: Get.height * 120 / 812,
                                      width: Get.height * 120 / 812,
                                      alignment: Alignment.center,
                                      color: Colors.yellow,
                                      child: const Icon(
                                        Icons.star_rate,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Dismissible(
                                      key: UniqueKey(),
                                      direction: DismissDirection.startToEnd,
                                      onDismissed: (_) {},
                                      secondaryBackground: Container(
                                        padding: const EdgeInsets.all(20),
                                        alignment: Alignment.center,
                                        color: Colors.yellow,
                                        child: const Icon(
                                          Icons.star_rate,
                                          color: Colors.white,
                                        ),
                                      ),
                                      background: Container(
                                        padding: const EdgeInsets.all(20),
                                        alignment: Alignment.centerRight,
                                        color: Colors.yellow,
                                        child: const Icon(
                                          Icons.star_rate,
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Image.network(
                                        controller.cartPruducts[index].image,
                                        fit: BoxFit.cover,
                                        height: Get.height * 120 / 812,
                                        width: Get.height * 120 / 812,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.cartPruducts[index].name,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      '\$${controller.cartPruducts[index].price}',
                                      style: const TextStyle(
                                          fontSize: 16, color: primaryColor),
                                    ),
                                    Container(
                                      height: Get.height * 30 / 812,
                                      width: Get.width * 95 / 375,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                controller.increase(index);
                                                controller.update();
                                              },
                                              child: const Icon(Icons.add)),
                                          Text(controller
                                              .cartPruducts[index].count
                                              .toString()),
                                          InkWell(
                                              onTap: () {
                                                controller.decrease(index);
                                              },
                                              child: const Icon(Icons.remove))
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                color: Colors.white,
                width: Get.width,
                height: Get.height * 84 / 812,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Total'.toUpperCase()),
                        Text(
                          '\$${controller.total}',
                          style: const TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => CheckoutView());
                      },
                      child: const Text(
                        "Checkout",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              Get.width * 146 / 375, Get.height * 50 / 812)),
                    ),
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
