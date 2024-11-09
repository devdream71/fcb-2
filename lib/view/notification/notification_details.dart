import 'package:fcb_global/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationDetails extends StatelessWidget {
  const NotificationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.appcolor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
        
             const SizedBox(height: 20,),

             const Text("Notification Details", style: TextStyle(color: Colors.white, fontSize: 16)),
        
            const SizedBox(height: 20,),
        
            const Text("Due to the uncertainty in the forex market caused by the U.S. elections, companies are investing only minimally, making forex trading highly risky. As a result, respected stakeholders will not receive ROI and matching benefits until November 10, 2024.", style: TextStyle(color: Colors.white),),
            const SizedBox(height: 10,),
        
            const Text("Start Date: May 12, 2024", style: TextStyle(color: Colors.white, fontSize: 12)),
            const Text("End Date: June 14, 2025", style: TextStyle(color: Colors.white, fontSize: 12)),
            const SizedBox(height: 30,),
        
            const Center(child: Text("Active", style: TextStyle(color: Colors.green, fontSize: 16))),
         
          ],
        ),
      ),
    ));
  }
}
