import 'package:dotted_border/dotted_border.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/package/package_controll/package_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackageDetails extends StatelessWidget {
  const PackageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiController apiController = Get.put(ApiController());
    final packages = apiController.apiResponse.value?.packages ?? {};
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Packages Details",
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
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Package - 1",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Package Type: Membership/Investment',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const Text(
                "Deposit Bonus: 0 ",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Daily ROI: 70\$ + ",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Max ROI Generate: 200 Days ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Descripton:",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Upline Referral Generation:",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
