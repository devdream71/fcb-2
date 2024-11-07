import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/widget/custome_textfield.dart';
import 'package:fcb_global/widget/label_with_asterrisk.dart';
import 'package:flutter/material.dart';

class Withdraw extends StatelessWidget {
  const Withdraw({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.appcolor,
      body: Padding(
        padding: const EdgeInsets.only(left:15, right: 15, top: 5, bottom: 2),      child: Column(
        children: [

          SizedBox(height: 15,),
          Card(
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '\$55',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),),

          SizedBox(height: 20,),





          const LabelWithAsterisk(labelText: 'Amount *Min 20\$' , isRequired: true, color: Colors.white,),

          AppTextFormField(
            controller: TextEditingController(),
            hintText: "Amount",
            //validator: validator.validateEmail,
            prefixIcon: const Icon(Icons.paid),
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 8,),

          const LabelWithAsterisk(labelText: 'TRC20 Wallet' , isRequired: true, color: Colors.white,),

          AppTextFormField(
            controller: TextEditingController(),
            hintText: "Wallet",
            //validator: validator.validateEmail,
            prefixIcon: const Icon(Icons.paid),
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 8,),

          const LabelWithAsterisk(labelText: 'Charge 3%' , isRequired: true, color: Colors.white,),

          AppTextFormField(
            controller: TextEditingController(),
            hintText: "5 ",
            //validator: validator.validateEmail,
            prefixIcon: const Icon(Icons.paid),
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 40,),

          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle request action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),  // Set border radius to 8
                ),
              ),
              child: Text(
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
