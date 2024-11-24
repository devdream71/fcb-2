import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/widget/label_with_asterrisk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/custome_textfield.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.appcolor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Change Password",
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
            const SizedBox(height: 10,),
            const LabelWithAsterisk(
              labelText: 'New Password',
              isRequired: true,
              color: Colors.white,
            ),
            AppTextFormField(
              controller: TextEditingController(),
              hintText: "Password",
              //validator: validator.validateEmail,
              prefixIcon: const Icon(Icons.password),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            const LabelWithAsterisk(
              labelText: 'Conform Password',
              isRequired: true,
              color: Colors.white,
            ),
            AppTextFormField(
              controller: TextEditingController(),
              hintText: "Conform Password",
              //validator: validator.validateEmail,
              prefixIcon: const Icon(Icons.password),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle request action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Set border radius to 8
                  ),
                ),
                child: const Text(
                  'Change Password',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
