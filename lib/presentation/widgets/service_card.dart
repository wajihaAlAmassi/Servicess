import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/jobdetails');
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('After 15 Minutes',
                style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Facebook Social Media Design',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.favorite_border, color: Colors.grey.shade600),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage('assets/images/avatar.png')),
                SizedBox(width: 4),
                Text('Madeha Ahmed'),
                SizedBox(width: 8),
                Icon(Icons.location_on, size: 14, color: Colors.grey),
                Text('Lebanon'),
                SizedBox(width: 8),
                Icon(Icons.attach_money, size: 14),
                Text('1500 /Month'),
                SizedBox(width: 8),
                Icon(Icons.star, size: 14, color: Colors.amber),
                Icon(Icons.star, size: 14, color: Colors.amber),
                Icon(Icons.star, size: 14, color: Colors.amber),
                Icon(Icons.star_half, size: 14, color: Colors.amber),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
              'Lorem Ipsum has been the industry\'s standard dummy text...',
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
