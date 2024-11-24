import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/about/controller/about_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class About extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  About({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger data fetch
    userController.fetchUserInfo();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "About",
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
              const SizedBox(height: 10),
              Obx(() {
                if (userController.isLoading.value) {
                  return const CircularProgressIndicator();
                } else if (userController.errorMessage.isNotEmpty) {
                  return Text(
                    userController.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person),
                        ),
                        title: const Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          userController.name.value,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.phone),
                        ),
                        title: const Text(
                          "Phone",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          userController.phone.value,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.email),
                        ),
                        title: const Text(
                          "Email",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          userController.email.value,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person_outline),
                        ),
                        title: const Text(
                          "Gender",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          userController.gender.value,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
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
