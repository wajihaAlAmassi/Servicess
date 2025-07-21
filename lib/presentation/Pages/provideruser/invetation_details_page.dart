import 'package:flutter/material.dart';
import 'package:services_application/core/utils/app_colors.dart';
import '../../widgets/appear/tag_chip.dart';
import '../../widgets/appear/bullet_text.dart';
import '../../widgets/Inputs/skill_chip.dart';


class InvitationDetailsPage extends StatelessWidget {
  const InvitationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Face Book Social Media ...',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.borderGrey,
                    blurRadius: 6,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User info
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Madeha Ahmed',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 14, color: Colors.grey),
                              SizedBox(width: 4),
                              Text('Lebanon'),
                              SizedBox(width: 8),
                              Icon(Icons.star, size: 14, color: AppColors.yellowAccent),
                              Icon(Icons.star, size: 14, color: AppColors.yellowAccent),
                              Icon(Icons.star, size: 14, color: AppColors.yellowAccent),
                              Icon(Icons.star_half, size: 14, color: AppColors.yellowAccent),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.favorite_border, color: Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Description
                  const Text('Job Description',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  const Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                  ),
                  const SizedBox(height: 16),

                  // Requirements
                  const Text('Job Requirements',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  const BulletText(
                      text:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', ),
                  const BulletText(
                      text:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
                  const BulletText(text: 'Lorem Ipsum is simply dummy text'),

                  const SizedBox(height: 16),

                  // Tags
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      TagChip(label: 'Part Time'),
                      TagChip(label: 'On-Site'),
                      TagChip(label: '1500\$ / M'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Skills
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderGrey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Required Skills',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      SkillChip(label: 'Graphic'),
                      SkillChip(label: 'Art'),
                      SkillChip(label: 'ASP.Net'),
                      SkillChip(label: 'PHP'),
                      SkillChip(label: 'UI/UX'),
                      SkillChip(label: 'Css'),
                      SkillChip(label: 'HTML 5'),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Text(
              'Application deadline : 12 Feb 2024',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            // Buttons
           Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    ElevatedButton(
      onPressed: () {
        // كود القبول
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Accept',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
    const SizedBox(height: 12),
    ElevatedButton(
      onPressed: () {
     
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Reject',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  ],
),

          ],
        ),
      ),
    );
  }
}
