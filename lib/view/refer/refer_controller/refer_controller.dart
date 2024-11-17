// import 'package:fcb_global/view/refer/refer_model/refer_model.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// class MyReferController extends GetxController {
//   // Observables to store data and states
//   var myReferData = Rx<MyReferApiResponseModel?>(null); // API response model
//   var isLoading = false.obs; // Loading state
//   var errorMessage = ''.obs; // Error message, if any

//   RxString token = ''.obs;

//   Future<void> loadToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     token.value = prefs.getString('auth_token') ?? '';
//   }

//   // Your API endpoint URL
//   final String apiUrl =
//       'https://fcbglobal.uk/api/v1/inject'; // Replace with your API URL

//   @override
//   void onInit() {
//     super.onInit();
//     fetchMyReferData(); // Fetch data when the controller is initialized
//   }

//   // Function to fetch data from the API
//   Future<void> fetchMyReferData() async {
//     try {
//       // Show loading indicator
//       isLoading.value = true;
//       errorMessage.value = '';

//       // Make the GET request
//       final response = await http.post(
//         Uri.parse(
//           apiUrl,
//         ),
//         headers: {
//           'Authorization': 'Bearer ${token.value}', // Use the loaded token
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         // Parse the response body
//         final Map<String, dynamic> jsonData = json.decode(response.body);

//         // Map the response into the model
//         myReferData.value = MyReferApiResponseModel.fromJson(jsonData);

//         // Hide loading indicator
//         isLoading.value = false;
//       } else {
//         // Handle server errors (non-200 responses)
//         errorMessage.value = 'Failed to load data. Please try again later.';
//         isLoading.value = false;
//       }
//     } catch (e) {
//       // Handle any exceptions
//       errorMessage.value = 'An error occurred: $e';
//       isLoading.value = false;
//     }
//   }
// }



import 'package:fcb_global/view/refer/refer_model/refer_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MyReferController extends GetxController {
  // Observables to store data and states
  var myReferData = Rx<MyReferApiResponseModel?>(null);  // API response model
  var isLoading = false.obs;  // Loading state
  var errorMessage = ''.obs;  // Error message, if any

  RxString token = ''.obs;

  // Load the token from SharedPreferences
  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('auth_token') ?? '';
  }

  // Your API endpoint URL
  final String apiUrl = 'https://fcbglobal.uk/api/v1/inject';

  @override
  void onInit() {
    super.onInit();
    loadToken().then((_) {
      fetchMyReferData();  // Fetch data after the token is loaded
    });
  }

  // Function to fetch data from the API
  Future<void> fetchMyReferData() async {
    try {
      // Show loading indicator
      isLoading.value = true;
      errorMessage.value = '';

      if (token.value.isEmpty) {
        errorMessage.value = 'Token is missing. Please log in again.';
        isLoading.value = false;
        return;
      }

      // Make the POST request
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer ${token.value}', // Use the loaded token
          'Content-Type': 'application/json',
        },
      );

      // Debugging: Log response status and body
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        // Parse the response body
        final Map<String, dynamic> jsonData = json.decode(response.body);

        // Map the response into the model
        myReferData.value = MyReferApiResponseModel.fromJson(jsonData);

        // Hide loading indicator
        isLoading.value = false;
      } else {
        // Handle server errors (non-200 responses)
        errorMessage.value = 'Failed to load data. Please try again later.';
        isLoading.value = false;
        print("Error: ${response.statusCode}, ${response.body}");
      }
    } catch (e) {
      // Handle any exceptions
      errorMessage.value = 'An error occurred: $e';
      isLoading.value = false;
      print("Exception: $e");
    }
  }
}
