// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class WalletController extends GetxController {
//   RxString wallets = ''.obs;
   
//   RxBool isLoading = false.obs;
//   RxString errorMessage = ''.obs;

//   var token = ''.obs;

//   // Load token from SharedPreferences
//   Future<void> loadToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     token.value = prefs.getString('auth_token') ?? ''; // Retrieve token or default to empty
//   }

//   Future<void> fetchUserInfo() async {
//     await loadToken();  // Ensure token is loaded before making the request

//     if (token.value.isEmpty) {
//       errorMessage.value = 'No token found. Please log in.';
//       return;
//     }

//     isLoading.value = true;
//     errorMessage.value = '';

//     try {
//       final response = await http.post(
//         Uri.parse('https://fcbglobal.uk/api/v1/inject'),
//         headers: {
//           'Authorization': 'Bearer ${token.value}',  // Use dynamic token
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         final wallets = data['wallets'];

//         // Extracting required fields
//         name.value = wallets['balance'] ?? 'N/A';
//         // phone.value = wallets['phone'] ?? 'N/A';
//         // email.value = wallets['email'] ?? 'N/A';
         
//       } else {
//         errorMessage.value = 'Error ${response.statusCode}: ${response.reasonPhrase}';
//       }
//     } catch (e) {
//       errorMessage.value = 'Failed to fetch data: $e';
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
