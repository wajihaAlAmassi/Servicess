import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
// ignore: depend_on_referenced_packagesظ
// import 'package:file_picker/file_picker.dart';
// import '../../core/theme/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PlatformFile? cvFile;
  PlatformFile? portfolioFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Account Info',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Row(
              children: [
                const CircleAvatar(
                  raadius: 355,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      'MOHAMED ALI',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      child: Text(
                        'Graphic Designer',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 24),

            // Personal Info
            const Text('Personal Info',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildInfoRow('Age', '20 Years'),
            _buildInfoRow('Year Of Experiences', '3 Years'),
            _buildInfoRow('Education Level', "Bachelor's"),

            const SizedBox(height: 24),

            // Contact Info
            const Text('Contact Info',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildInfoRow('Phone number', '+966 50 4567 666'),
            _buildInfoRow('Email', 'AhmedAli@gmail.com'),
            _buildInfoRow('Location', 'Palestine - Gaza'),

            const SizedBox(height: 24),

            // CV Upload
            const Text('Cv', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildUploadBox('Upload Your Cv Here', () async {
              final result = await FilePicker.platform.pickFiles();
              if (result != null) {
                setState(() {
                  cvFile = result.files.first;
                });
              }
            }, cvFile),

            const SizedBox(height: 24),

            // Portfolio Upload
            const Text('Portfolio',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildUploadBox('Upload Your Portfolio Here', () async {
              final result = await FilePicker.platform.pickFiles();
              if (result != null) {
                setState(() {
                  portfolioFile = result.files.first;
                });
              }
            }, portfolioFile),

            const SizedBox(height: 24),

            // Skills
            const Text('Skills', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                _SkillChip(label: 'Graphic'),
                _SkillChip(label: 'Art'),
                _SkillChip(label: 'ASP.Net'),
                _SkillChip(label: 'PHP'),
                _SkillChip(label: 'UI/UX'),
                _SkillChip(label: 'Css'),
                _SkillChip(label: 'HTML 5'),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildUploadBox(String text, VoidCallback onTap,
      [PlatformFile? file]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          file != null ? file.name : text,
          style: TextStyle(color: file != null ? Colors.black : Colors.grey),
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.borderGrey,
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.black, fontSize: 12),
      ),
    );
  }
}
