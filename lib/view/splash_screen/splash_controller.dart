import 'package:fcb_global/utils/url.dart';
import 'package:fcb_global/view/login/login_view.dart';
import 'package:fcb_global/view/splash_screen/splash_screen_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class KeyController extends GetxController {
  final String getKey = APPURI.getKey;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkAndFetchKeys();
  }

  Future<void> checkAndFetchKeys() async {
    isLoading.value = true;
    KeyResponseModel? storedKeyData = await getStoredKeys();

    if (storedKeyData != null) {
      // Print stored keys to terminal
      print('Stored client_id: ${storedKeyData.clientId}');
      print('Stored sendingKey: ${storedKeyData.sendingKey}');
      print('Stored receivingKey: ${storedKeyData.receivingKey}');
      
      isLoading.value = false;
      Get.offAll(LoginView());
    } else {
      KeyResponseModel? fetchedKeyData = await fetchAndSaveKeys();
      isLoading.value = false;
      if (fetchedKeyData != null) {
        // Print fetched keys to terminal
        print('Fetched client_id: ${fetchedKeyData.clientId}');
        print('Fetched sendingKey: ${fetchedKeyData.sendingKey}');
        print('Fetched receivingKey: ${fetchedKeyData.receivingKey}');
        
        Get.offAll(LoginView());
      } else {
        print('Failed to fetch keys');
      }
    }
  }

  Future<KeyResponseModel?> fetchAndSaveKeys() async {
    try {
      final response = await http.post(Uri.parse(getKey));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        KeyResponseModel keyData = KeyResponseModel.fromJson(data);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('client_id', keyData.clientId);
        await prefs.setString('sendingKey', keyData.sendingKey);
        await prefs.setString('receivingKey', keyData.receivingKey);

        return keyData;
      } else {
        print('Failed to load keys');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }


  

  Future<KeyResponseModel?> getStoredKeys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? clientId = prefs.getInt('client_id');
    String? sendingKey = prefs.getString('sendingKey');
    String? receivingKey = prefs.getString('receivingKey');

    if (clientId != null && sendingKey != null && receivingKey != null) {
      return KeyResponseModel(
        clientId: clientId,
        sendingKey: sendingKey,
        receivingKey: receivingKey,
      );
    }
    return null;
  }

 
}
