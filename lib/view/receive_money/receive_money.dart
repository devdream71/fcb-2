import 'package:dotted_border/dotted_border.dart';
import 'package:fcb_global/view/package/package_controll/package_controller.dart';
import 'package:fcb_global/view/package/package_details.dart';
import 'package:fcb_global/view/receive_money/controller/receive_money_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fcb_global/utils/app_colors.dart';

class ReceiveMoney extends StatelessWidget {
  const ReceiveMoney({super.key});

  @override
  Widget build(BuildContext context) {
    final ReceiveMoneyController apiController = Get.put(ReceiveMoneyController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        //backgroundColor: Color(0xffF3E5F5),
        body: Obx(() {
          if (apiController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (apiController.errorMessage.isNotEmpty) {
            return Center(child: Text(apiController.errorMessage.value));
          }

          // Fetch the data once the token is loaded
          if (apiController.token.value.isNotEmpty &&
              apiController.apiResponse.value == null) {
            apiController
                .fetchData(); // Fetch data only once the token is available
          }

          final packages = apiController.apiResponse.value?.packages ?? {};
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Receive Money",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    ...packages.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Get.to(const PackageDetails(),
                                transition: Transition.rightToLeftWithFade);
                          },
                          child: DottedBorder(
                            color: Colors.white,
                            strokeWidth: 1,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date: ${entry.key.toUpperCase()}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Amount: ${entry.value}\$",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                   
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}