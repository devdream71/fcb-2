import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/about/controller/about_controller.dart';
import 'package:fcb_global/view/send_money_history/view_send_money_history/view_send_money_history.dart';
import 'package:fcb_global/widget/custome_textfield.dart';
import 'package:fcb_global/widget/label_with_asterrisk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendMoney extends StatelessWidget {
  SendMoney({super.key});

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    userController.fetchUserInfo();
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.appcolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 2),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Send Money",
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
              height: 15,
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
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Usable 0",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            const LabelWithAsterisk(
              labelText: 'Wallet',
              isRequired: true,
              color: Colors.white,
            ),
            AppTextFormField(
              controller: TextEditingController(),
              hintText: "Wallet",
              //validator: validator.validateEmail,
              prefixIcon: const Icon(Icons.paid),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 8,
            ),
            const LabelWithAsterisk(
              labelText: 'Amount',
              isRequired: true,
              color: Colors.white,
            ),
            AppTextFormField(
              controller: TextEditingController(),
              hintText: "Amount",
              //validator: validator.validateEmail,
              prefixIcon: const Icon(Icons.paid),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 8,
            ),
            const LabelWithAsterisk(
              labelText: 'Charge 0%',
              isRequired: true,
              color: Colors.white,
            ),
            AppTextFormField(
              controller: TextEditingController(),
              hintText: "5 ",
              //validator: validator.validateEmail,
              prefixIcon: const Icon(Icons.paid),
              keyboardType: TextInputType.number,
              readOnly: true,
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
                  'Transfer',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Send Money History",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Get.to(SendMoneyPage(),
                    transition: Transition.rightToLeftWithFade);
              },
              child: Container(
                height: 45,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  "Send Money History",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
