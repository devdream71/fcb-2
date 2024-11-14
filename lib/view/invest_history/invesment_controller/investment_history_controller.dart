import 'package:fcb_global/view/invest_history/investment_history_model/investment_history_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InvestmentController extends GetxController {
  var investments = <Investment>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadToken();
  }

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('auth_token') ?? '';
    if (token.isNotEmpty) {
      fetchInvestments();
    } else {
      errorMessage.value = 'Token not found';
    }
  }

  Future<void> fetchInvestments() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse('https://fcbglobal.uk/api/v1/investment'),
        headers: {
          'Authorization': 'Bearer ${token.value}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        investments.value =
            data.map((json) => Investment.fromJson(json)).toList();
      } else {
        errorMessage.value = 'Failed to load data: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }
 
}
