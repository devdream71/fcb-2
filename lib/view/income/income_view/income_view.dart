import 'package:dotted_border/dotted_border.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/income/income_controller/income_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeView extends StatelessWidget {
  const IncomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final IncomeApiController apiController = Get.put(IncomeApiController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Obx(() {
          // Show CircularProgressIndicator when data is loading
          if (apiController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show error message if any
          if (apiController.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    apiController.errorMessage.value,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: apiController.fetchData,
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }

          // Display empty state if no data is available
          final incomes = apiController.apiResponse.value?.incomes ?? [];
          if (incomes.isEmpty) {
            return const Center(
              child: Text(
                "No income data available",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          // Show the list of incomes
          return RefreshIndicator(
            onRefresh: apiController.fetchData,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Income",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(15),
                      itemCount: incomes.length,
                      itemBuilder: (context, index) {
                        final entry = incomes[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              // Handle tap here if needed
                            },
                            child: DottedBorder(
                              color: Colors.white,
                              strokeWidth: 1,
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Amount: ${entry['amount']}\$",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Before Balance: ${entry['before_balance']}',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    Text(
                                      'After Balance: ${entry['after_balance']}',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    Text(
                                      'Before L Carry Point: ${entry['before_l_carry_point']}',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    Text(
                                      'After L Carry Point: ${entry['after_l_carry_point']}',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    Text(
                                      'Before R Carry Point: ${entry['before_r_carry_point']}',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    Text(
                                      'After R Carry Point: ${entry['after_r_carry_point']}',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    Text(
                                      'Date: ${entry['date']}',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                     
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                
                
                
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}