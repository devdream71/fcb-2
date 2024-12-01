import 'package:fcb_global/utils/app_assets.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/utils/app_space.dart';
import 'package:fcb_global/view/change_password/change_password.dart';
import 'package:fcb_global/view/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _loginFormKey = GlobalKey<FormState>();
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 110.0,
                  height: 110.0,
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
                        style: const TextStyle(
                            color: Colors.black), // Set text color to black
                        decoration: InputDecoration(
                          hintText: "",
                          hintStyle: const TextStyle(
                              color: Colors
                                  .black54), // Set hint text color to black with lower opacity
                          prefixIcon: const Icon(Icons.person,
                              color: Colors
                                  .black), // Set prefix icon color to black
                          filled:
                              true, // Make sure the field has a background color
                          fillColor:
                              Colors.white, // Set background color to white
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color:
                                    Colors.black), // Set border color to black
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Colors.black), // Focused border color
                          ),
                          errorStyle: const TextStyle(
                            color:
                                Colors.yellow, // Error text color set to white
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
                          obscureText: !loginController.isPasswordVisible.value,
                          onChanged: (value) {
                            loginController.password.value = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          style: const TextStyle(
                              color: Colors.black), // Set text color to black
                          decoration: InputDecoration(
                            hintText: " ",
                            hintStyle: const TextStyle(
                                color: Colors
                                    .black54), // Set hint text color to black with lower opacity
                            prefixIcon: const Icon(Icons.password,
                                color: Colors
                                    .black), // Set prefix icon color to black
                            suffixIcon: IconButton(
                              icon: Icon(
                                loginController.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors
                                    .black, // Set suffix icon color to black
                              ),
                              onPressed:
                                  loginController.togglePasswordVisibility,
                            ),
                            filled:
                                true, // Make sure the field has a background color
                            fillColor:
                                Colors.white, // Set background color to white
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Colors
                                      .black), // Set border color to black
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Colors.black), // Focused border color
                            ),
                            errorStyle: const TextStyle(
                              color:
                                  Colors.yellow, // Error text color set to white
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
                                  if (_loginFormKey.currentState!.validate()) {
                                    loginController.login();
                                  }
                                },
                                child: Container(
                                  height: 50,
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
      ),
    );
  }
}



// import 'package:fcb_global/utils/app_assets.dart';
// import 'package:fcb_global/utils/app_colors.dart';
// import 'package:fcb_global/utils/app_space.dart';
// import 'package:fcb_global/view/change_password/change_password.dart';
// import 'package:fcb_global/view/login/controller/login_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginView extends StatelessWidget {
//   LoginView({super.key});

//   final _loginFormKey = GlobalKey<FormState>();
//   final loginController = Get.put(LoginController());

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.appcolor,
//         body: Padding(
//           padding: const EdgeInsets.all(12),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(height: 20),
//                 Container(
//                   width: 110.0,
//                   height: 110.0,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       fit: BoxFit.fill,
//                       image: AssetImage(AppAssets.appLogo),
//                     ),
//                   ),
//                 ),
//                 AppSpace.spaceH10,
//                 const Text(
//                   "Welcome To FCB Global",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 AppSpace.spaceH18,
//                 Form(
//                   key: _loginFormKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           "E-Mail",
//                           style: GoogleFonts.notoSans(
//                             color: Colors.white,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                       TextFormField(
//                         onChanged: (value) {
//                           loginController.email.value = value;
//                         },
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           }
//                           if (!GetUtils.isEmail(value)) {
//                             return 'Please enter a valid email';
//                           }
//                           return null;
//                         },
//                         style: const TextStyle(color: Colors.black),
//                         decoration: InputDecoration(
//                           hintText: "demo@gmail.com",
//                           hintStyle: const TextStyle(color: Colors.black54),
//                           prefixIcon: const Icon(Icons.person, color: Colors.black),
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: const BorderSide(color: Colors.black),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: const BorderSide(color: Colors.black),
//                           ),
//                           errorStyle: const TextStyle(color: Colors.yellow),
//                         ),
//                       ),
//                       AppSpace.spaceH8,
//                       const Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           "Password",
//                           style: TextStyle(color: Colors.white, fontSize: 18),
//                         ),
//                       ),
//                       Obx(
//                         () => TextFormField(
//                           obscureText: !loginController.isPasswordVisible.value,
//                           onChanged: (value) {
//                             loginController.password.value = value;
//                           },
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your password';
//                             }
//                             return null;
//                           },
//                           style: const TextStyle(color: Colors.black),
//                           decoration: InputDecoration(
//                             hintText: "password",
//                             hintStyle: const TextStyle(color: Colors.black54),
//                             prefixIcon: const Icon(Icons.password, color: Colors.black),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 loginController.isPasswordVisible.value
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                                 color: Colors.black,
//                               ),
//                               onPressed: loginController.togglePasswordVisibility,
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: const BorderSide(color: Colors.black),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: const BorderSide(color: Colors.black),
//                             ),
//                             errorStyle: const TextStyle(color: Colors.yellow),
//                           ),
//                         ),
//                       ),
//                       AppSpace.spaceH14,
//                       const SizedBox(height: 20),
//                       Obx(
//                         () => loginController.isLoading.value
//                             ? Center(
//                                 child: CircularProgressIndicator(
//                                   color: AppColors.buttonColor,
//                                 ),
//                               )
//                             : InkWell(
//                                 onTap: () {
//                                   if (_loginFormKey.currentState!.validate()) {
//                                     loginController.login();
//                                   }
//                                 },
//                                 child: Container(
//                                   height: 50,
//                                   width: double.infinity,
//                                   padding: const EdgeInsets.all(8.0),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8),
//                                     color: AppColors.buttonColor,
//                                   ),
//                                   child: const Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       "Login",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 18,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                       ),
//                       AppSpace.spaceH14,
//                       InkWell(
//                         onTap: () {
//                           Get.to(() => const ChangePassword(),
//                               transition: Transition.rightToLeftWithFade);
//                         },
//                         child: const Text(
//                           "Forgot Your password?",
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 250,
//                   width: 250,
//                   child: Image.asset(
//                     AppAssets.logo,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
