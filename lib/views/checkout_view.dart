import 'dart:ui';

import 'package:ecommerce1/helpers/constants.dart';
import 'package:ecommerce1/helpers/cut_string.dart';
import 'package:ecommerce1/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutView extends GetWidget<CartViewModel> {
  CheckoutView({Key? key}) : super(key: key);

  final PageController pageController = PageController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int currntPage = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (cont) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(Get.width, Get.height * 0.1),
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Text(
                  currntPage == 2 ? 'Summary' : 'Checkout',
                  style: const TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              color: Colors.white,
              child: Stack(
                children: [
                  ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: const Text(
                          'Standard Delivery',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                            'Order will be delivered between 3 - 5 business days'),
                        trailing: Radio(
                          value: 'Standard',
                          groupValue: cont.radioVal,
                          onChanged: (value) {
                            cont.radioVal = value.toString();
                            cont.update();
                          },
                          activeColor: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: const Text(
                          'Next Day Delivery',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                            'Place your order before 6pm and your items will be delivered the next day'),
                        trailing: Radio(
                          value: 'Next ',
                          groupValue: cont.radioVal,
                          onChanged: (value) {
                            cont.radioVal = value.toString();
                            cont.update();
                          },
                          activeColor: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: const Text(
                          'Nominated Delivery',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                            'Pick a particular date from the calendar and order will be delivered on selected date'),
                        trailing: Radio(
                          value: 'Nominated ',
                          groupValue: cont.radioVal,
                          onChanged: (value) {
                            cont.radioVal = value.toString();
                            cont.update();
                          },
                          activeColor: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: Get.height * 20 / 812,
                    right: Get.width * 20 / 375,
                    child: ElevatedButton(
                      onPressed: () {
                        currntPage = 1;
                        controller.update();
                        pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutQuint);
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              Get.width * 146 / 375, Get.height * 50 / 812)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Get.height,
              width: Get.width,
              color: Colors.white,
              child: Stack(
                children: [
                  Form(
                    key: formKey,
                    child: SizedBox(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.05,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset('assets/check.png'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                      'Billing address is the same as delivery address')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text('Street'),
                                    ],
                                  ),
                                  TextFormField(
                                    controller: controller.streetCont,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'fill the field';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        hintText: '21, Alex Davidson Avenue'),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text('City'),
                                    ],
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'fill the field';
                                      }
                                      return null;
                                    },
                                    controller: controller.cityCont,
                                    decoration: const InputDecoration(
                                        hintText: 'Victoria Island'),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: const [
                                            Text('State'),
                                          ],
                                        ),
                                        TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'fill the field';
                                            }
                                            return null;
                                          },
                                          controller: controller.stateCont,
                                          decoration: const InputDecoration(
                                              hintText: 'Victoria Island'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: const [
                                            Text('Country'),
                                          ],
                                        ),
                                        TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'fill the field';
                                            }
                                            return null;
                                          },
                                          controller: controller.countryCont,
                                          decoration: const InputDecoration(
                                              hintText: 'Victoria Island'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.1,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Get.height * 20 / 812,
                    right: Get.width * 20 / 375,
                    child: ElevatedButton(
                      onPressed: () {
                        currntPage = 2;
                        controller.update();
                        if (formKey.currentState!.validate()) {
                          pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOutQuint);
                        }
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              Get.width * 146 / 375, Get.height * 50 / 812)),
                    ),
                  ),
                  Positioned(
                    bottom: Get.height * 20 / 812,
                    left: Get.width * 20 / 375,
                    child: ElevatedButton(
                      onPressed: () {
                        currntPage = 0;
                        controller.update();
                        pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutQuint);
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                          side: BorderSide(color: primaryColor),
                          fixedSize: Size(
                              Get.width * 146 / 375, Get.height * 50 / 812)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Get.height,
              width: Get.width,
              color: Colors.white,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.1,
                      ),
                      SizedBox(
                        height: Get.height * 220 / 812,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cont.cartPruducts.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      cont.cartPruducts[index].image,
                                      fit: BoxFit.cover,
                                      height: Get.width * 120 / 375,
                                      width: Get.width * 120 / 375,
                                    ),
                                    SizedBox(
                                      width: Get.width * 120 / 375,
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Text(
                                                  cutString(cont
                                                      .cartPruducts[index]
                                                      .name),
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                              ),
                                              Text(
                                                '\$${cont.cartPruducts[index].price * cont.cartPruducts[index].count}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: primaryColor),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Text(
                                            '${cont.cartPruducts[index].count}X',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text(
                          'Shipping Address',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${cont.streetCont!.text},${cont.cityCont!.text},${cont.stateCont!.text},${cont.countryCont!.text}',
                          style: TextStyle(fontSize: 16),
                        ),
                        trailing: Image.asset('assets/check.png'),
                      ),
                      const Divider(),
                    ],
                  ),
                  Positioned(
                    bottom: Get.height * 20 / 812,
                    right: Get.width * 20 / 375,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.sendOrder();
                      },
                      child: const Text(
                        "Diliver",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              Get.width * 146 / 375, Get.height * 50 / 812)),
                    ),
                  ),
                  Positioned(
                    bottom: Get.height * 20 / 812,
                    left: Get.width * 20 / 375,
                    child: ElevatedButton(
                      onPressed: () {
                        currntPage = 1;
                        controller.update();
                        pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutQuint);
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                          side: const BorderSide(color: primaryColor),
                          fixedSize: Size(
                              Get.width * 146 / 375, Get.height * 50 / 812)),
                    ),
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
