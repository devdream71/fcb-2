import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/about/controller/about_controller.dart';
import 'package:fcb_global/view/withdraw/withdraw_history.dart';
import 'package:fcb_global/widget/custome_textfield.dart';
import 'package:fcb_global/widget/label_with_asterrisk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';

class Withdraw extends StatelessWidget {
  Withdraw({super.key});

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    userController.fetchUserInfo();
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.appcolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Withdraw",
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
            InkWell(
              onTap: () {
                Get.to(() => const WithdrawHistory(),
                    transition: Transition.leftToRightWithFade);
              },
              child: Container(
                height: 45,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.buttonColor),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "View Withdraw  History",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Dash(
                direction: Axis.horizontal,
                length: 230,
                dashLength: 12,
                dashColor: Colors.white),
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
                          '\$ ${userController.myWallet.value}',
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
            const LabelWithAsterisk(
              labelText: 'Amount *Min 20\$',
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
              labelText: 'TRC20 Wallet',
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
              labelText: 'Charge 3%',
              isRequired: true,
              color: Colors.white,
            ),
            AppTextFormField(
              controller: TextEditingController(),
              hintText: "5 ",
              //validator: validator.validateEmail,
              prefixIcon: const Icon(Icons.paid),
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
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Set border radius to 8
                  ),
                ),
                child: const Text(
                  'Balance must be grater than \$20',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
