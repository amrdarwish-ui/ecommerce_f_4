import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce1/helpers/db_helper.dart';
import 'package:ecommerce1/models/cart_pruduct_model.dart';
import 'package:ecommerce1/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CartViewModel extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //databse vars
  List<CartPruductModel> cartPruducts = [];
  DBHelper? dbHelper;
  int total = 0;
  //ui vars
  String radioVal = 'Standard';
  //checkout adderss conts
  TextEditingController? streetCont;
  TextEditingController? cityCont;
  TextEditingController? stateCont;
  TextEditingController? countryCont;
  //firestore
  CollectionReference orderRef =
      FirebaseFirestore.instance.collection('orders');
  @override
  void onInit() {
    dbHelper = DBHelper();
    dbHelper!.createDatabase();
    getAllToCart();
    super.onInit();
    stateCont = TextEditingController();
    cityCont = TextEditingController();
    streetCont = TextEditingController();
    countryCont = TextEditingController();
  }

  Future<void> addToCart(CartPruductModel model) async {
    await dbHelper!.createPruduct(model);
  }

  Future<void> getAllToCart() async {
    cartPruducts.clear();
    dbHelper!.allPruducts().then((value) {
      for (var i in value) {
        cartPruducts.add(CartPruductModel.fromMap(i));
      }
      calcTotal();
      update();
    });
  }

  Future<void> calcTotal() async {
    total = 0;

    for (var i in cartPruducts) {
      total = total + i.price * i.count;
    }
  }

  void delete(int id) {
    dbHelper!.delete(id);
    getAllToCart();
  }

  void increase(int index) {
    cartPruducts[index].count++;
    dbHelper!.update(cartPruducts[index]).then((value) async {
      calcTotal();
    });
  }

  void decrease(int index) {
    if (cartPruducts[index].count != 1) {
      cartPruducts[index].count--;
      dbHelper!.update(cartPruducts[index]).then((value) {
        calcTotal();
        update();
      });
    }
  }

  Future<void> sendOrder() async {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
    ));
    OrderModel orderModel = OrderModel(
        deliveryType: radioVal,
        userId: firebaseAuth.currentUser!.uid,
        address:
            '${streetCont!.text},${cityCont!.text},${stateCont!.text},${countryCont!.text}',
        isDelverd: false,
        prudcts: cartPruducts);
    await orderRef.doc().set(orderModel.toMap()).then((value) {
      dbHelper!.clearTable();
      cartPruducts.clear();
      total = 0;
      Get.back();
      Get.back();
      Get.defaultDialog(
          title: 'Congratulates',
          content: const Text('the order sent sucsessfully'),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Ok'))
          ]);
    });
    update();
  }

  @override
  void onClose() {
    cityCont!.dispose();
    stateCont!.dispose();
    streetCont!.dispose();
    countryCont!.dispose();
    super.onClose();
  }
}
