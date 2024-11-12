import 'package:dio/dio.dart';
import 'package:fcb_global/view/login/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fcb_global/view/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isPasswordVisible = false.obs;
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Login API call
  Future<void> login() async {

    //email and password controller

    var emailController = email.value;
    var passwordConteoller = password.value;

    print("emailController ==========$emailController");
    print("passwordController ==========$passwordConteoller");

    // if (email.value.isEmpty || password.value.isEmpty) {
    //   Get.snackbar('Error', 'Please enter both email and password');
    //   return;
    // }

    try {
      isLoading.value = true;
      Dio dio = Dio();

      // Retrieve client_id from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? clientId = prefs.getInt('client_id');

      if (clientId == null) {
        Get.snackbar('Error', 'Client ID is not available');
        isLoading.value = false;
        return;
      }

      // Use HTTPS endpoint
      //https://fcbglobal.uk/api/v1/login
      // client_id
      //password
      //user_id
      //
      final response = await dio.post(
        'https://fcbglobal.uk/api/v1/login', // Ensure this is HTTPS
        data: {
          //'client_id': clientId,
          //'data': password.value,
          //'app_id': 1001,
          'user_id': emailController,
          'password': passwordConteoller
        },
        options: Options(
          // headers: {
          //   'Content-Type': 'application/json',
          // },
        ),
      );

      // Check the response status
      if (response.statusCode == 200) {
        final loginResponse = LoginResponseModel.fromJson(response.data);
        Get.to(() => const HomeView());
      } else {
        Get.snackbar('Error', 'Login failed. Please try again.', 
        backgroundColor: Colors.red,


        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong. Please try again later.');
    } finally {
      isLoading.value = false;
    }
  }
}
