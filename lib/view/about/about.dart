import 'package:fcb_global/utils/app_colors.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.appcolor,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),),
              title: Text("Name", style: TextStyle(color: Colors.white),),
              subtitle: Text("Harish", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
            ),

            ListTile(
              leading: CircleAvatar(child: Icon(Icons.email),),
              title: Text("Email", style: TextStyle(color: Colors.white),),
              subtitle: Text("haaarshraj@gmail.com", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
            ),
          ],
        ),
      ),
    ));
  }
}
