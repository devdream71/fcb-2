import 'dart:convert'; // For JSON decoding
import 'package:fcb_global/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Login function
  Future<void> login() async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('https://fcbglobal.uk/api/v1/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'password': password.value,
          'user_id': email.value,
        }),
      );

      // Print the response status and body to the terminal for debugging
      debugPrint('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        String responseBody = response.body;

        // Check if the response body starts with a number (indicating it's just the token)
        if (responseBody.contains('|')) {
          // Extract the token from the response
          final token = responseBody.split('|')[1];

          // Save the token if present
          await saveToken(token);
          debugPrint('Token: $token');
          Get.offAll(() => const HomeView());
          Get.snackbar('Success', 'Login successful',
              backgroundColor: Colors.green, margin: const EdgeInsets.all(2));
        } else {
          // Handle the case where the response is in JSON format and contains a token
          final Map<String, dynamic> responseJson = json.decode(responseBody);
          final token = responseJson['token'];

          if (token != null) {
            await saveToken(token);
            debugPrint('Token: $token');
            Get.to(() => const HomeView());
            Get.snackbar('Success', 'Login successful',
                backgroundColor: Colors.green, margin: const EdgeInsets.all(2));
          } else {
            // Show error message if token is missing
            Get.snackbar('Error', 'Invalid email or password',
                backgroundColor: Colors.red, margin: const EdgeInsets.all(2));
          }

          //
          if (token != null) {
            await saveToken(token);
            Get.to(() => const HomeView());
          } else {
            Get.snackbar('Error', 'Invalid email or password',
                backgroundColor: Colors.red, margin: const EdgeInsets.all(2));
          }
        }
      } else {
        // Handle errors from the server, such as invalid credentials
        Get.snackbar(
          'Error',
          'Invalid email or password',
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      // Print the error message to the terminal for debugging
      print('Error: $e');
      Get.snackbar('Error', 'Invalid email or password',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  // Save the token to SharedPreferences
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token); // Save the token
  }
}






////=====working

// import 'dart:convert';

// import 'package:fcb_global/view/home/home_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginController extends GetxController {
//   var email = ''.obs;
//   var password = ''.obs;
//   var isLoading = false.obs;
//   var isPasswordVisible = false.obs;

//   void togglePasswordVisibility() {
//     isPasswordVisible.value = !isPasswordVisible.value;
//   }

//   Future<void> login() async {
//     isLoading.value = true;
//     try {
//       final response = await http.post(
//         Uri.parse('https://fcbglobal.uk/api/v1/login'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: '{"password": "${password.value}", "user_id": "${email.value}"}',
//       );

//       // Print the response status and body to the terminal
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         // Handle a successful response
//         final token = response.body;
//         await saveToken(token);
//         print('token: ${token}');

//         Get.to(() => const HomeView());
//         Get.snackbar('Success', 'Login successful');
//         // Navigate to Home or another screen if needed
//       } else {
//         // Handle errors from server
//         Get.snackbar('Error', 'Invalid email or password');
//       }
//     } catch (e) {
//       // Print error message to terminal for debugging
//       print('Error: $e');
//       Get.snackbar('Error', 'An error occurred. Please try again.');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('auth_token', token);
//   }
// }




// import 'package:fcb_global/view/home/home_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// class LoginController extends GetxController {
//   var email = ''.obs;
//   var password = ''.obs;
//   var isLoading = false.obs;
//   var isPasswordVisible = false.obs;

//   void togglePasswordVisibility() {
//     isPasswordVisible.value = !isPasswordVisible.value;
//   }

//   Future<void> login() async {
//     isLoading.value = true;
//     try {
//       final response = await http.post(
//         Uri.parse('https://fcbglobal.uk/api/v1/login'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: '{"password": "${password.value}", "user_id": "${email.value}"}',
//       );

//       // Print the response status and body to the terminal
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         // Handle a successful response
//         final data = json.decode(response.body);
//         final token = data['token'];  // Assuming the token is in the 'token' field

//         if (token != null) {
//           await saveToken(token);
//           print('Token saved: $token');
//           Get.to(() => const HomeView());  // Navigate to HomeView
//           Get.snackbar('Success', 'Login successful');
//         } else {
//           Get.snackbar('Error', 'Token not found in response');
//         }
//       } else {
//         // Handle errors from server
//         Get.snackbar('Error', 'Invalid email or password');
//       }
//     } catch (e) {
//       // Print error message to terminal for debugging
//       print('Error: $e');
//       Get.snackbar('Error', 'An error occurred. Please try again.');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Save the token to SharedPreferences
//   Future<void> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('auth_token', token);
//     print('Token saved to SharedPreferences');
//   }
// }
