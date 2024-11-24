import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final String avatarImagePath;
  final String userName;
  final String userPhone;
  final String userEmail;
  final String referByName;
  final int leftMemberCount;
  final int rightMemberCount;

  const UserProfileCard({
    Key? key,
    required this.avatarImagePath,
    required this.userName,
    required this.userPhone,
    required this.userEmail,
    required this.referByName,
    required this.leftMemberCount,
    required this.rightMemberCount,
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
          ),
        ),
        Text(
          userEmail,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          'Ref Name: $referByName',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$leftMemberCount',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const Text(
              ' || ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              '$rightMemberCount',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
