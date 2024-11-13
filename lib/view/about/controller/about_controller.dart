import 'package:fcb_global/view/about/model/about_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  // about section
  RxString name = ''.obs;
  RxString phone = ''.obs;
  RxString email = ''.obs;
  RxString gender = ''.obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  RxString receiveMoney = ''.obs;

  // wallet section
  //RxInt myWallet = 0.obs; // wallet balance
  RxDouble myWallet = 0.0.obs; 

  //RxDouble myWallet2 = 0.0.obs; 

  //package
  RxString package = ''.obs;

  //receive_money
  



  var token = ''.obs;

  // Load token from SharedPreferences
  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('auth_token') ?? ''; // Retrieve token or default to empty
  }

  Future<void> fetchUserInfo() async {
    await loadToken();  // Ensure token is loaded before making the request

    if (token.value.isEmpty) {
      errorMessage.value = 'No token found. Please log in.';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse('https://fcbglobal.uk/api/v1/inject'),
        headers: {
          'Authorization': 'Bearer ${token.value}',  // Use dynamic token
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final userInfo = data['userInfo'];

        // Extracting required fields
        name.value = userInfo['name'] ?? 'Unknown';
        phone.value = userInfo['phone'] ?? 'N/A';
        email.value = userInfo['email'] ?? 'N/A';
        gender.value = (userInfo['gender_id'] == 0 ? 'Male' : 'Female');

        // Extract wallet balance
        final wallet = data['wallets'] != null && data['wallets'].isNotEmpty
            ? data['wallets'][0]  // Assuming the first wallet is the primary wallet
            : null;

        if (wallet != null) {
          myWallet.value = wallet['balance'] ?? 0;
        } else {
          myWallet.value = 0; // If no wallet found, default to 0
        }

      
      } else {
        errorMessage.value = 'Error ${response.statusCode}: ${response.reasonPhrase}';
      }
    } catch (e) {
      errorMessage.value = 'Failed to fetch data: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
