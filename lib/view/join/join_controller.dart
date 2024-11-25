import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class JoinController extends GetxController {
  final isLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxString token = ''.obs; // Store the token

  // Load token from SharedPreferences
  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('auth_token') ?? '';
  }

  // Submit the join form
  Future<void> submitJoinForm({
    required String email,
    required int upline,
    required int position,
    required String name,
    required String phone,
    required int genderId,
  }) async {
    isLoading.value = true;
    await loadToken();  // Load the token before making the API request

    if (token.value.isEmpty) {
      errorMessage.value = 'No token found. Please log in.';
      Get.snackbar('Error', errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      isLoading.value = false;
      return;
    }

    const String apiUrl = 'https://fcbglobal.uk/api/v1/join';
    final Map<String, dynamic> body = {
      "email": email,
      "upline": upline,
      "position": position,
      "name": name,
      "phone": phone,
      "gender_id": genderId,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token.value}',
        },
        body: jsonEncode(body),
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}'); // Debugging response

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        Get.snackbar('Success', 'User joined successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        print('Response: $responseData');
      } else {
        try {
          final responseData = jsonDecode(response.body);
          errorMessage.value = responseData['message'] ?? 'Failed to join';
          Get.snackbar('Error', errorMessage.value,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
          print('Error: ${responseData['message']}');
        } catch (e) {
          errorMessage.value = 'Failed to parse error message: $e';
          Get.snackbar('Error', errorMessage.value,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
          print('Error parsing response body: $e');
        }
      }
    } catch (e) {
      // Handle exceptions
      errorMessage.value = 'Something went wrong: $e';
      Get.snackbar('Error', errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      print('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }
}




 