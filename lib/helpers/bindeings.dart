import 'package:ecommerce1/view_model/auth_view_model.dart';
import 'package:ecommerce1/view_model/explore_view_model.dart';
import 'package:get/get.dart';

import '../view_model/cart_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ExploreViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}
