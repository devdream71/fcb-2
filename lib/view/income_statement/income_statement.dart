import 'package:fcb_global/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeStatement extends StatelessWidget {
  const IncomeStatement({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.appcolor,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16.0, top: 5, bottom: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Income Statement",
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
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            const Center(
                child: Text(
              'No Income Statement',
              style: TextStyle(color: Colors.white, fontSize: 16),
            )),

            //listtile
            // const ListTile(
            //   leading: CircleAvatar(
            //     child: Text("1"),
            //   ),
            //   title: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Amount: \$ 500",
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 16,
            //             fontWeight: FontWeight.w600),
            //       ),
            //       Text(
            //         "Wallet: \$ 1250",
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 16,
            //             fontWeight: FontWeight.w600),
            //       ),
            //     ],
            //   ),
            //   subtitle: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Investment: \$ 5250",
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 14,
            //             fontWeight: FontWeight.w400),
            //       ),
            //       Text(
            //         "Date: Feb 12, 2024",
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 14,
            //             fontWeight: FontWeight.w400),
            //       ),
            //     ],
            //   ),
            //   trailing: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Text(
            //         "Status: Active",
            //         style: TextStyle(
            //             color: Colors.green,
            //             fontSize: 14,
            //             fontWeight: FontWeight.w400),
            //       ),
            //       Text(
            //         "Type: Pro",
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 14,
            //             fontWeight: FontWeight.w400),
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(
              height: 10,
            ),

            //list tile
            // const ListTile(
            //   leading: CircleAvatar(
            //     child: Text("2"),
            //   ),
            //   title: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Amount: \$ 500",
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 16,
            //         ),
            //       ),
            //       Text(
            //         "Wallet: \$ 1250",
            //         style: TextStyle(color: Colors.white, fontSize: 16),
            //       ),
            //     ],
            //   ),
            //   subtitle: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Investment: \$ 5250",
            //         style: TextStyle(color: Colors.white, fontSize: 14),
            //       ),
            //       Text(
            //         "Date: Feb 12, 2024",
            //         style: TextStyle(color: Colors.white, fontSize: 14),
            //       ),
            //     ],
            //   ),
            //   trailing: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Text(
            //         "Status: Active",
            //         style: TextStyle(color: Colors.green, fontSize: 14),
            //       ),
            //       Text(
            //         "Type: Pro",
            //         style: TextStyle(color: Colors.white, fontSize: 14),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }
}
