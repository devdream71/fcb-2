import 'package:fcb_global/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.appcolor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            //about list tile 1
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
              title: Text(
                "Name",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "Harish",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
            //about list tile 2
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.email),
              ),
              title: Text(
                "Email",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "haaarshraj@gmail.com",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
