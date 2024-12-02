import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/deposit/deposit_history.dart';
import 'package:fcb_global/widget/custome_textfield.dart';
import 'package:fcb_global/widget/label_with_asterrisk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';

class Deposit extends StatelessWidget {
  const Deposit({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 5.0, left: 16, right: 16, bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Deposit",
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
                    Get.to(() => const DepositHistory());
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
                        "View All  History",
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
                const Align(
                  alignment: Alignment.center,
                  child: const Dash(
                      direction: Axis.horizontal,
                      length: 230,
                      dashLength: 12,
                      dashColor: Colors.white),
                ),
                const SizedBox(
                  height: 15,
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
                  height: 10,
                ),

                const LabelWithAsterisk(
                  labelText: 'TRC20 Wallet',
                  isRequired: true,
                  color: Colors.white,
                ),

                Row(
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        controller: TextEditingController(),
                        hintText: "TMkLsmXa9sgWDTCdX5T7S",
                        //validator: validator.validateEmail,
                        prefixIcon: const Icon(Icons.content_copy),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(
                        Icons.copy,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Copy wallet address action
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black.withOpacity(0.8),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(
                      'assets/images/qrcode.PNG',
                      width: double.infinity,
                      height: 250,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                const SizedBox(height: 16),
                // TextField(
                //   decoration: InputDecoration(
                //     labelText: 'Note',
                //     hintText: 'Please Put your Phone number',
                //     border: OutlineInputBorder(),
                //   ),
                // ),
                const LabelWithAsterisk(
                  labelText: 'Note',
                  isRequired: true,
                  color: Colors.white,
                ),

                AppTextFormField(
                  maxline: 1,
                  controller: TextEditingController(),
                  hintText: "Please put your phone number",
                  //validator: validator.validateEmail,
                  prefixIcon: const Icon(Icons.description),
                ),

                const SizedBox(height: 16),
                const LabelWithAsterisk(
                  labelText: 'Screenshot',
                  isRequired: true,
                  color: Colors.white,
                ),

                const SizedBox(height: 16),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle request action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8),  
                      ),
                    ),
                    child: const Text(
                      'Request',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
