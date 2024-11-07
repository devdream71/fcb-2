import 'package:fcb_global/utils/app_assets.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/utils/app_space.dart';
import 'package:fcb_global/utils/validator.dart';
import 'package:fcb_global/view/home/home_view.dart';
import 'package:fcb_global/view/login/controller/password_controller.dart';
import 'package:fcb_global/widget/custome_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoginPassView extends StatelessWidget {
  LoginPassView({super.key});

  final passwordFormKey = GlobalKey<FormState>();
  final passwordController = Get.put(PasswordController());  // Initialize the controller

  @override
  Widget build(BuildContext context) {
    final validator = AppValidation();

    return Scaffold(
      backgroundColor: AppColors.appcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
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
                        key: passwordFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Password",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),


                            ///
                            // AppTextFormField(
                            //   controller: TextEditingController(),
                            //   hintText: "demo@gmailo.com",
                            //   validator: validator.validateEmail,
                            //   prefixIcon: Icon(Icons.person),
                            // ),


                            ///
                            Obx(() => CustomTextField(
                              height: 50,
                              radius: 8,
                              prefixIcon: Icon(Icons.password),
                              hintText: "password",
                              obscureText: !passwordController.isPasswordVisible.value,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  passwordController.isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: passwordController.togglePasswordVisibility,
                              ),
                              //validator: (value) => validator.validatePassword(value),
                            )),
                            AppSpace.spaceH14,
                            InkWell(
                              onTap: () {
                                if (passwordFormKey.currentState!.validate()) {
                                  Get.to(() => const HomeView(),
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
                                    "Login",
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
