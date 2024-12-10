import 'package:fcb_global/view/about/controller/about_controller.dart';
import 'package:fcb_global/view/team/team_model/team_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TreeController extends GetxController {
  var isLoading = false.obs;
  var treeData = Rx<TreeResponse?>(null);
  var token = ''.obs;

  //final UserController userController = Get.put(UserController());
  final UserController userController = Get.find<UserController>();

  @override
  void onInit() {
    super.onInit();
    initializeController(); 
   //await userController.fetchUserInfo();
  }

  Future<void> initializeController() async {
    int treeID = userController.treeid.value;
    await loadToken();
    if (token.isNotEmpty) {
      //fetchTreeData(430);
      fetchTreeData(treeID);
      print("==========> $treeID");
    } else {
      debugPrint('Error: Token not found');
      Get.snackbar('Error', 'Authentication token is missing.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('auth_token') ?? '';
    debugPrint('Token loaded: ${token.value}');
  }

  Future<void> fetchTreeData(int id) async {
    isLoading.value = true;
    
    try {
      final response = await http.post(
        Uri.parse('https://fcbglobal.uk/api/v1/tree'),
        headers: {
          'Authorization': 'Bearer ${token.value}',
          'Content-Type': 'application/json',
        },
        //body: jsonEncode({'user_id': userId}),
        body: jsonEncode({'user_id': id}),
      );

      if (response.statusCode == 200) {
        print("=======> $id");
        final jsonData = jsonDecode(response.body);
        treeData.value = TreeResponse.fromJson(jsonData);
        debugPrint('Tree data fetched successfully');
        debugPrint(response.body);

      
        
      } else {
        debugPrint(
            'Error: Failed to fetch tree data. Status code: ${response.statusCode}');
        // Get.snackbar('Error', 'Failed to fetch tree data',
        // snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      debugPrint('Exception caught: $e');
     // Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Downlink? selectedData;

  Downlink? leftDataFirstZen;
  Downlink? rtighDataFirstZen;

  Downlink? leftDataSecondZen;
  Downlink? rtighDataSecondZen;

  bool isSelect = false;

  bool secondZenSelected = false;
  getMyRootUser() {
    isSelect = !isSelect;
    print(isSelect);
  }

  getLeftUserSelected(
    Downlink leftDataFirst,
    Downlink rightDataFirst,
  ) {
    leftDataFirstZen = leftDataFirst;
    rtighDataFirstZen = rightDataFirst;
    update();
  }
}
