import 'package:dotted_border/dotted_border.dart';
import 'package:fcb_global/view/package/package_controll/package_controller.dart';
import 'package:fcb_global/view/package/package_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fcb_global/utils/app_colors.dart';

class PackageView extends StatelessWidget {
  const PackageView({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiController apiController = Get.put(ApiController());

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
                          "Packages",
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
                            color: Colors.white,
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
                              width: double.infinity,
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    entry.key.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Invest: ${entry.value}\$",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // const Text(
                                  //   'Package Type: Membership/Investment',
                                  //   style: TextStyle(
                                  //       fontSize: 16, color: Colors.white),
                                  // ),
                                  // const Text(
                                  //   "Deposit Bonus: 0 ",
                                  //   style: TextStyle(
                                  //     fontSize: 16,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                  // const Text(
                                  //   "Daily ROI: 70\$ + ",
                                  //   style: TextStyle(
                                  //     fontSize: 16,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                  // const Align(
                                  //   alignment: Alignment.topLeft,
                                  //   child: Text(
                                  //     "Max ROI Generate: 200 Days ",
                                  //     style: TextStyle(
                                  //       fontSize: 16,
                                  //       color: Colors.white,
                                  //     ),
                                  //   ),
                                  // ),
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
