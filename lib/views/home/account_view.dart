import 'package:ecommerce1/helpers/constants.dart';
import 'package:ecommerce1/view_model/account_view_model.dart';
import 'package:ecommerce1/views/auth/sign_in_view.dart';
import 'package:ecommerce1/views/home/track_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends GetWidget<AccountViewModel> {
  AccountView({Key? key}) : super(key: key);
  final controller = Get.put(AccountViewModel());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountViewModel>(
      builder: (_) => SafeArea(
        child: Scaffold(
            body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: Get.width * 120 / 375,
                      width: Get.width * 120 / 375,
                      child: const Center(
                          // child:
                          //     Icon(Icons.person, color: primaryColor, size: 50),
                          ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(controller.firebaseAuth
                                          .currentUser!.photoURL! !=
                                      null
                                  ? controller
                                      .firebaseAuth.currentUser!.photoURL!
                                  : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5VcKtDrI3GxuxemmJJ9SXS0u-Tn4B7nBTFR__FMBrFQ&s')),
                          color: primaryColor.withOpacity(0.3),
                          shape: BoxShape.circle),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.firebaseAuth.currentUser!.displayName!,
                          style: TextStyle(fontSize: 26),
                        ),
                        Text(
                          controller.firebaseAuth.currentUser!.email!,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => TrackView());
                },
                child: ListTile(
                  title: const Text(
                    'Trck Order',
                  ),
                  leading: Image.asset('assets/track.png'),
                  trailing: const RotatedBox(
                      quarterTurns: 2,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.firebaseAuth.signOut().then((value) {
                    Get.offAll(() => SignInView());
                  });
                },
                child: ListTile(
                  title: const Text(
                    'Logout',
                  ),
                  leading: Image.asset('assets/log_out.png'),
                  trailing: const RotatedBox(
                      quarterTurns: 2,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      )),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
