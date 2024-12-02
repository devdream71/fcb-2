import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ReceiveMoneyController extends GetxController {
  // About section
  RxString name = ''.obs;
  RxString phone = ''.obs;
  RxString email = ''.obs;
  RxString gender = ''.obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  RxString receiveMoney = ''.obs; // To display receive money information

  // Wallet section
  RxDouble myWallet = 0.0.obs;

  // Package section
  RxString package = ''.obs;

  var token = ''.obs;

  @override
void onInit() {
  super.onInit();
  fetchUserInfo();  // Load data when the controller is initialized
}


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

        // Extract required fields
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

        // Extract receive_money data and format it
        final receiveMoneyData = data['receive_money'] as Map<String, dynamic>? ?? {};
        receiveMoney.value = receiveMoneyData.entries
            .map((entry) => '${entry.key}: ${entry.value}')
            .join('\n');  // Format each entry as "date-time: amount"

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
