import 'package:ecommerce1/helpers/constants.dart';
import 'package:ecommerce1/view_model/explore_view_model.dart';
import 'package:ecommerce1/views/home/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../widgets/search_wid.dart';

class ExploreView extends GetWidget<ExploreViewModel> {
  ExploreView({Key? key}) : super(key: key);
  // ignore: annotate_overrides
  final controller = Get.put(ExploreViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: GetBuilder<ExploreViewModel>(
          builder: (cont) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchWid(),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: Get.height * 90 / 812,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.catList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Image.network(
                                        controller.catList[index].img)),
                              ),
                              const Spacer(),
                              Text(controller.catList[index].name),
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: const [
                      Text(
                        'Best Selling',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'see all',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: Get.height * 319 / 812,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.productList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(DetailsView(
                                      model: controller.productList[index]));
                                },
                                child: Image.network(
                                  controller.productList[index].img,
                                  height: Get.height * 240 / 812,
                                  width: Get.width * 164 / 375,
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.productList[index].name,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(controller.productList[index].brand,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey)),
                                  Text(
                                      '\$${controller.productList[index].price}',
                                      style: const TextStyle(
                                          fontSize: 16, color: primaryColor))
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
