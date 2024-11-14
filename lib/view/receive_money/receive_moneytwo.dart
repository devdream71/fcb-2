import 'package:fcb_global/view/receive_money/controller/receive_money_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';  
import 'package:fcb_global/utils/app_colors.dart';

class ReceiveMoneyPage extends StatelessWidget {
  final ReceiveMoneyController receiveMoneyController =
      Get.put(ReceiveMoneyController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Obx(() {
          if (receiveMoneyController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (receiveMoneyController.errorMessage.isNotEmpty) {
            return Center(
                child: Text(receiveMoneyController.errorMessage.value));
          }

          // Split receiveMoney data by lines
          final receiveMoneyList =
              receiveMoneyController.receiveMoney.value.split('\n');

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Receive Money",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(15.0),
                    itemCount: receiveMoneyList.length,
                    itemBuilder: (context, index) {
                      final entry = receiveMoneyList[index];
                      final parts = entry.split(
                          ':'); // Split to extract date and amount if possible

                      // Extract date and amount based on the expected format
                      String date = parts.isNotEmpty
                          ? parts[0].replaceFirst('date - ', '').trim()
                          : 'Unknown date';
                      final amount = parts.length > 1 ? parts[1].trim() : '0';

                      // Convert date to DateTime and format to 12-hour with AM/PM
                      try {
                        final parsedDate = DateTime.parse(date);
                        date = DateFormat('MM-dd-yyyy : hh:mm a').format(
                            parsedDate); // Format date as "MM-dd-yyyy hh:mm a"
                      } catch (e) {
                        // If parsing fails, keep the original date
                        date = 'Invalid date';
                      }

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            '${index + 1}', // Display the index (1-based) inside CircleAvatar
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        title: Text(
                          'Date: $date\nAmount: ৳ $amount',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
