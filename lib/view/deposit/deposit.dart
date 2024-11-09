import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/widget/custome_textfield.dart';
import 'package:fcb_global/widget/label_with_asterrisk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Deposit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        // appBar: AppBar(
        //   backgroundColor: AppColors.appcolor,
        //
        // ),
        // appBar: AppBar(
        //   backgroundColor: AppColors.appcolor,
        //   leading: IconButton(
        //     icon: CircleAvatar(
        //         backgroundColor: Colors.white.withOpacity(0.4),
        //         child: Icon(Icons.arrow_back)),
        //     color: Colors.white,  // Set the back button color to white
        //     onPressed: () {
        //       // Handle back button press
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 5.0, left: 16, right: 16, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                maxline: 2,
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
                          BorderRadius.circular(8), // Set border radius to 8
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
    );
  }
}
