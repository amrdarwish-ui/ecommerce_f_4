import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce1/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AccountViewModel extends GetxController {
  CollectionReference UserRef = FirebaseFirestore.instance.collection('users');
  CollectionReference ordersRef =
      FirebaseFirestore.instance.collection('orders');
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String email = '';
  String name = '';
  List<OrderModel> orderList = [];
  Future<void> getUserData() async {
    await UserRef.where('id', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      name = value.docs[0]['name'];
      email = value.docs[0]['email'];
    });
    print('----------------------------------> $email');
    update();
  }

  Future<void> getOrders() async {
    orderList.clear();
    await ordersRef
        .where('userId', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      for (var i in value.docs) {
        orderList.add(OrderModel.fromMap(i));
      }
      update();
    });
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }
}
