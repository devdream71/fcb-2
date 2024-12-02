import 'dart:ui';
import 'package:fcb_global/utils/app_assets.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/utils/app_space.dart';
import 'package:fcb_global/view/change_password/change_password.dart';
import 'package:fcb_global/view/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginFormKey = GlobalKey<FormState>();
  final loginController = Get.put(LoginController());
  bool _isDialogOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isDialogOpen = true;
      });
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => BookingDialog(
          onClose: () {
            setState(() {
              _isDialogOpen = false;
            });
            Navigator.of(context).pop();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 90.0,
                      height: 90.0,
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    AppSpace.spaceH18,
                    Form(
                      key: _loginFormKey,
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
                          //email field
                          TextFormField(
                            onChanged: (value) {
                              loginController.email.value = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!GetUtils.isEmail(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.black),
                            cursorHeight: 15,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 12,
                              ),
                              hintText: "",
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon:
                                  const Icon(Icons.person, color: Colors.black),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              errorStyle: const TextStyle(
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                          AppSpace.spaceH8,
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
                          //password field
                          Obx(
                            () => TextFormField(
                              obscureText:
                                  !loginController.isPasswordVisible.value,
                              onChanged: (value) {
                                loginController.password.value = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.black),
                              cursorHeight: 15,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 12,
                                ),
                                hintText: " ",
                                hintStyle:
                                    const TextStyle(color: Colors.black54),
                                prefixIcon: const Icon(Icons.password,
                                    color: Colors.black),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    loginController.isPasswordVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                  onPressed:
                                      loginController.togglePasswordVisibility,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                          ),
                          AppSpace.spaceH14,
                          const SizedBox(height: 20),
                          Obx(
                            () => loginController.isLoading.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.buttonColor,
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      if (_loginFormKey.currentState!
                                          .validate()) {
                                        loginController.login();
                                      }
                                    },
                                    child: Container(
                                      height: 45,
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.buttonColor,
                                      ),
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
                          ),
                          AppSpace.spaceH14,

                          InkWell(
                            onTap: () {
                              Get.to(() => const ChangePassword(),
                                  transition: Transition.rightToLeftWithFade);
                            },
                            child: const Text(
                              "Forgot Your password?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: Image.asset(
                        AppAssets.logo,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_isDialogOpen)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BookingDialog extends StatelessWidget {
  final VoidCallback onClose;

  const BookingDialog({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 15,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 15,
                      color: Colors.red,
                    ),
                    onPressed: onClose,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Card(
              child: Center(
                child: SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Image.asset('assets/images/bangladesh_victory.png'),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
