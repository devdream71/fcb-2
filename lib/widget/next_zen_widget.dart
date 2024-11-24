import 'package:flutter/material.dart';

class DownlinkUserCard extends StatelessWidget {
  final String avatarImagePath;
  final String userName;
  final String userPhone;
  final String userEmail;
  final bool isActive;

  const DownlinkUserCard({
    Key? key,
    required this.avatarImagePath,
    required this.userName,
    required this.userPhone,
    required this.userEmail,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(avatarImagePath),
        ),
        Text(
          userName,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          userPhone,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          userEmail,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        if (isActive)
          const Icon(
            Icons.keyboard_double_arrow_down,
            color: Colors.black,
            size: 35,
          ),
      ],
    );
  }
}
