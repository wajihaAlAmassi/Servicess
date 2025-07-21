import 'package:flutter/material.dart';

class ContentCardWidget extends StatelessWidget {
  final String title;
  final String personName;
  final String location;
  final String salary;
  final String description;

  const ContentCardWidget({
    super.key,
    required this.title,
    required this.personName,
    required this.location,
    required this.salary,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey, width: .4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // العنوان والمفضلة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "  $title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Icon(Icons.favorite_border_outlined),
              ],
            ),
            SizedBox(height: 5),
            // الاسم، الموقع، والراتب
            Row(
              children: [
                SizedBox(width: 7),
                Icon(Icons.person, size: 15),
                Text(
                  personName,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(width: 7),
                Icon(
                  Icons.location_on_outlined,
                  size: 15,
                  color: Color(0xFFFF4CB1),
                ),
                Text(
                  location,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(width: 7),
                Icon(
                  Icons.attach_money_sharp,
                  size: 15,
                  color: Color(0xFFFF4CB1),
                ),
                Text(
                  "$salary \$/Month",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 5),
            // الوصف
            Padding(
              padding: const EdgeInsets.only(left: 7.0),
              child: Text(
                description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: const Color.fromARGB(255, 101, 101, 101),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
