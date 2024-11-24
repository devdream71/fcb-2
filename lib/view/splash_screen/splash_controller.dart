// import 'package:fcb_global/view/home/home_view.dart'; // Import HomeView
// import 'package:fcb_global/view/login/login_view.dart'; // Import LoginView
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SplashController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//     checkToken();  // Check for token as soon as the controller is initialized
//   }

//   Future<void> checkToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('auth_token');

//     if (token != null && token.isNotEmpty) {
//       // Token exists, navigate to Home page
//       Future.delayed(Duration(seconds: 2), () {
//         Get.offAll(() => HomeView()); // Replace with your actual Home page
//       });
//     } else {
//       // No token, navigate to Login page
//       Future.delayed(Duration(seconds: 2), () {
//         Get.offAll(() => LoginView()); // Navigate to Login screen
//       });
//     }
//   }
// }




import 'package:fcb_global/view/home/home_view.dart';
import 'package:fcb_global/view/login/login_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  // This function checks for the presence of the token and navigates accordingly.
  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    // Navigate after a short delay for splash effect
    await Future.delayed(const Duration(seconds: 2));

    if (token != null && token.isNotEmpty) {
      Get.offAll(() => const HomeView(),
          transition: Transition.fadeIn, duration: const Duration(milliseconds: 500));
    } else {
      Get.offAll(() => LoginView(),
          transition: Transition.fadeIn, duration: const Duration(milliseconds: 500));
    }
  }
}
