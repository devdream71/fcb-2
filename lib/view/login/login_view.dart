

import 'package:fcb_global/utils/app_assets.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/utils/app_space.dart';
import 'package:fcb_global/utils/validator.dart';
import 'package:fcb_global/view/login/login_pass_view.dart';
import 'package:fcb_global/widget/custome_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
    LoginView({super.key});

  final _formKey = GlobalKey<FormState>();  // Form key for validation

  @override
  Widget build(BuildContext context) {
    final validator = AppValidation();

    return Scaffold(
      backgroundColor: AppColors.appcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140.0,
                        height: 140.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(AppAssets.appLogo),
                          ),
                        ),
                      ),
                      AppSpace.spaceH10,
                      const Text(
                        "Welcome To FCB Global",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      AppSpace.spaceH18,
                      Form(
                        key: _formKey,  // Assigning form key here
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "E-Mail",
                                style: GoogleFonts.notoSans(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            // CustomTextField(
                            //   height: 50,
                            //   radius: 8,
                            //   prefixIcon: Icon(Icons.person),
                            //   hintText: "demo@gmail.com",
                            //   //validator: validator.validateEmail,  // Applying email validation
                            // ),



                            AppTextFormField(
                              controller: TextEditingController(),
                              hintText: "demo@gmailo.com",
                              //validator: validator.validateEmail,
                              prefixIcon: Icon(Icons.person),
                            ),



                            AppSpace.spaceH14,
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  // If form is valid, proceed to the next page
                                  Get.to(() => LoginPassView(),
                                      transition: Transition.rightToLeft);
                                }
                              },
                              child: Container(
                                height: 50,
                                width: Get.width,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.buttonColor),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AppSpace.spaceH14,
                            const Text(
                              "Forgot Your password?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    AppAssets.logo,
                    fit: BoxFit.fill,
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

