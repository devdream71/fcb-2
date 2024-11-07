import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/widget/label_with_asterrisk.dart';
import 'package:flutter/material.dart';

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
            const LabelWithAsterisk(labelText: 'New Password' , isRequired: true, color: Colors.white,),

            AppTextFormField(
              controller: TextEditingController(),
              hintText: "Password",
              //validator: validator.validateEmail,
              prefixIcon: const Icon(Icons.password),
              keyboardType: TextInputType.number,

            ),

            SizedBox(height: 10,),

            const LabelWithAsterisk(labelText: 'Conform Password' , isRequired: true, color: Colors.white,),

            AppTextFormField(
              controller: TextEditingController(),
              hintText: "Conform Password",
              //validator: validator.validateEmail,
              prefixIcon: const Icon(Icons.password),
              keyboardType: TextInputType.number,

            ),

            const SizedBox(height: 40,),

            Center(
              child:
              ElevatedButton(
                onPressed: () {
                  // Handle request action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),  // Set border radius to 8
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
