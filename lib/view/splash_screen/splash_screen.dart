

// import 'package:fcb_global/utils/app_colors.dart';
// import 'package:fcb_global/view/splash_screen/splash_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
 

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Initialize the KeyController to check token when the SplashScreen is loaded
//     final SplashController keyController = Get.put(SplashController());

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.appcolor,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 10),
//               const Text(
//                 'FCB Global',
//                 style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),
//               // Display a loading indicator while checking the token
//               CircularProgressIndicator(
//                 color: Colors.white,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/splash_screen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use GetBuilder or Get.find to ensure the controller is initialized
    final SplashController splashController = Get.put(SplashController());

    // Call `checkToken` here in the UI's build method to trigger it
    splashController.checkToken();

    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                'FCB Global',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
