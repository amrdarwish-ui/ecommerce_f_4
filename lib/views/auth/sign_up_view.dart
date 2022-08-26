import 'package:ecommerce1/helpers/constants.dart';
import 'package:ecommerce1/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  SignUpView({Key? key}) : super(key: key);
  // ignore: annotate_overrides
  final controller = Get.put(AuthViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.07,
            ),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                  const Text(
                    'Name',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  TextFormField(
                    controller: controller.nameContoller,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  TextFormField(
                    controller: controller.emailContoller,
                    decoration:
                        const InputDecoration(hintText: 'email@examle.com'),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: controller.passContoller,
                    decoration: const InputDecoration(hintText: 'Password'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.signUp();
                    },
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(Get.width * 311 / 375, Get.height * 50 / 812)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
