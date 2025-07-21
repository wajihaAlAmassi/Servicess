import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(
          radius: 45,
          backgroundImage: AssetImage('assets/images/profile.png'),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MOHAMED ALI',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('Graphic Designer', style: TextStyle(color: Colors.grey)),
          ],
        )
      ],
    );
  }
}
