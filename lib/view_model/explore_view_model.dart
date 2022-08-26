import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce1/models/category_model.dart';
import 'package:ecommerce1/models/product_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class ExploreViewModel extends GetxController {
  List<CategoryModel> catList = [];
  List<ProductModel> productList = [];
  List<ProductModel> categryList = [];
  CollectionReference catRef =
      FirebaseFirestore.instance.collection('categories');
  CollectionReference productsRef =
      FirebaseFirestore.instance.collection('products');
  @override
  void onInit() {
    getCategories();
    getProudcts();
    super.onInit();
  }

  void getCategories() async {
    await catRef.orderBy('number', descending: false).get().then((value) {
      for (var i in value.docs) {
        catList.add(CategoryModel.fromMap(i));
      }
      update();
    });
  }

  void getProudcts() async {
    await productsRef.get().then((value) {
      for (var i in value.docs) {
        productList.add(ProductModel.fromMap(i));
      }
      update();
    });
  }

  void getProudctsCat(String cat) async {
    categryList.clear();
    await productsRef.where('category', isEqualTo: cat).get().then((value) {
      for (var i in value.docs) {
        productList.add(ProductModel.fromMap(i));
      }
      update();
    });
  }
}
