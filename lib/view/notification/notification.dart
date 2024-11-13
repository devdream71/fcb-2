import 'package:dotted_border/dotted_border.dart';
import 'package:fcb_global/utils/app_colors.dart';
import 'package:fcb_global/view/notification/notification_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppNotification extends StatelessWidget {
  const AppNotification({super.key});

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
                    "Notification",
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

            // ignore: prefer_const_constructors
            DottedBorder(
              child: ListTile(
                onTap: () {
                  Get.to(const NotificationDetails(),
                      transition: Transition.rightToLeftWithFade);
                },
                leading: const CircleAvatar(
                  child: Text("1"),
                ),
                title: const Text(
                  "Due to the uncertainty",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Start Date: May 12, 2024",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    Text("End Date: June 14, 2025",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
                trailing: const Text("Active",
                    style: TextStyle(color: Colors.green, fontSize: 16)),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            DottedBorder(
              strokeWidth: 1,
              borderType: BorderType.Rect,
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("2"),
                  ),
                  title: Text(
                    "Due to the uncertainty",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Start Date: May 12, 2024",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      Text("End Date: June 14, 2025",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  trailing: Text("Active",
                      style: TextStyle(color: Colors.green, fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
