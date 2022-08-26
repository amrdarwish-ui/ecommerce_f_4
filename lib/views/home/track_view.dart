import 'package:ecommerce1/helpers/constants.dart';
import 'package:ecommerce1/view_model/account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackView extends GetWidget<AccountViewModel> {
  TrackView({Key? key}) {
    super.key;
    controller.getOrders();
  }

  final controller = Get.put(AccountViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Track Order',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: GetBuilder<AccountViewModel>(
          builder: (_) => RefreshIndicator(
            onRefresh: () async {
              controller.getOrders();
            },
            child: controller.orderList.isEmpty
                ? const Center(
                    child: Text(
                      'No orders yet',
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.orderList.length,
                    itemBuilder: (context, index) {
                      return Container(
                          height: Get.height * (140 / Get.height),
                          width: double.infinity,
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 5),
                                    blurRadius: 10)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: Get.width * 0.4,
                                          child: Text(
                                              controller
                                                  .orderList[index].address,
                                              style: TextStyle(fontSize: 14)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '\$${controller.orderList[index].prudcts[0].price.round()}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: primaryColor),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: controller
                                                  .orderList[index].isDelverd
                                              ? primaryColor
                                              : Colors.yellow[600]),
                                      padding: const EdgeInsets.all(7.5),
                                      child: Text(
                                        controller.orderList[index].isDelverd
                                            ? 'Delivered'.tr
                                            : 'In Transit'.tr,
                                      ),
                                    )
                                    // SvgPicture.asset(
                                    //     cont.odersList[index].isDeliverd
                                    //         ? 'assets/svg_txts/deliverd.svg'
                                    //         : 'assets/svg_txts/intransit.svg')
                                  ],
                                ),
                              ),
                              Container(
                                height: Get.height * (105 / Get.height),
                                width: Get.height * (105 / Get.height),
                                child: Image.network(
                                  controller.orderList[index].prudcts[0].image,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ));
                    }),
          ),
        ));
  }
}
