import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/about/controller/about_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWallet extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    userController.fetchUserInfo();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 16.0, right: 16.0, top: 5, bottom: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "My Wallet",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() {
                if (userController.isLoading.value) {
                  return const CircularProgressIndicator();
                } else if (userController.errorMessage.isNotEmpty) {
                  return Text(
                    userController.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Available Balance',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${userController.myWallet.value}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
