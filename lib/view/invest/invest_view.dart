import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/utils/app_space.dart';
import 'package:fcb_global/widget/custome_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InvestView extends StatelessWidget {
  const InvestView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.appcolor,
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16, top: 5, right: 16, bottom: 5),
              child: Column(
                children: [
                  Center(
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
                        const Icon(
                          Icons.api_outlined,
                          size: 60,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                       
                        const Text(
                          "Welcome For Invest",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  AppSpace.spaceH18,
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Text(
                          "Package",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const CustomTextField(),
                  AppSpace.spaceH14,
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Text(
                          "Your Wallet",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const CustomTextField(),
                  AppSpace.spaceH10,
                  AppSpace.spaceH10,
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 45,
                      width: 85,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}