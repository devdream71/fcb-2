import 'package:dotted_border/dotted_border.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/invest_history/invesment_controller/investment_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InvestmentPage extends StatelessWidget {
  final InvestmentController controller = Get.put(InvestmentController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appcolor,
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          }

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
                        "Invest",
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
                    itemCount: controller.investments.length,
                    itemBuilder: (context, index) {
                      final investment = controller.investments[index];
                      return DottedBorder(
                        child: ListTile(
                          title: Text(
                            'Investment ID: ${investment.id}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Amount: ${investment.amount}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Profit: ${investment.profit}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Package: ${investment.package.packageName}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Daily Return: ${investment.package.dailyReturnOfInvest}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Start Date: ${investment.investmentStartDate}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'End Date ${investment.investmentEndDate}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
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
