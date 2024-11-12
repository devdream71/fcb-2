import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/widget/custome_textfield.dart';
import 'package:fcb_global/widget/label_with_asterrisk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendMoney extends StatelessWidget {
  const SendMoney({super.key});

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.red,
                ),
              ),
            ),
              ],
             ),
            const SizedBox(
              height: 15,
            ),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Available Balance',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '\$55',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
            )
          ],
        ),
      ),
    ));
  }
}
