import 'dart:convert';
import 'package:fcb_global/view/income/income_model/income_model.dart';
import 'package:fcb_global/view/package/model/package_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class IncomeApiController extends GetxController {
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  Rx<IncomeApiResponseModel?> apiResponse = Rx<IncomeApiResponseModel?>(null);
  RxString token = ''.obs;   

  // Function to load the token from SharedPreferences
  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('auth_token') ?? '';
  }

  // Fetch data from the API
  Future<void> fetchData() async {
    if (token.value.isEmpty) {
      errorMessage.value = 'No token found';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse('https://fcbglobal.uk/api/v1/inject'),
        headers: {
          'Authorization': 'Bearer ${token.value}',  // Use the loaded token
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Parse the JSON data
        final data = json.decode(response.body);
        apiResponse.value = IncomeApiResponseModel.fromJson(data);
      } else {
        errorMessage.value = 'Error: ${response.statusCode} - ${response.reasonPhrase}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadToken(); // Load the token when the controller is initialized
  }
}