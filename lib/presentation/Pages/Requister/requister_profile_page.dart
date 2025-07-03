import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:services_application/presentation/widgets/info_row.dart';

import '../../../core/utils/app_colors.dart';
import '../../widgets/profile_header.dart';
import '../../widgets/skill_chip.dart';
import '../../widgets/upload_box.dart';

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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.darkText),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Account Info',
          style: TextStyle(color: AppColors.darkText, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color:AppColors.darkText),
            onPressed: () {},
          ),
        ],

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              ProfileHeader(),
              SizedBox(height: 24),
              Text('Personal Info',
                style: TextStyle(fontWeight: FontWeight.bold)),
               InfoRow(label: 'Age', value: '20 Years'),
            InfoRow(label: 'Year Of Experiences', value: '3 Years'),
            InfoRow(label: 'Education Level', value: "Bachelor's"),
            SizedBox(height: 24),
            Text('Contact Info',
                style: TextStyle(fontWeight: FontWeight.bold)),
               SizedBox(height: 12),
               InfoRow(label: 'Phone number', value: '+966 50 4567 666'),
             InfoRow(label: 'Email', value: 'AhmedAli@gmail.com'),
           InfoRow(label: 'Location', value: 'Palestine - Gaza'),

             SizedBox(height: 24), 
              const Text('Cv', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            UploadBox(
              text: 'Upload Your Cv Here',
              file: cvFile,
              onTap: () async {
                final result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  setState(() {
                    cvFile = result.files.first;
                  });
                }
              },
            ),

            const SizedBox(height: 24),

            // Portfolio Upload
            const Text('Portfolio',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            UploadBox(
              text: 'Upload Your Portfolio Here',
              file: portfolioFile,
              onTap: () async {
                final result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  setState(() {
                    portfolioFile = result.files.first;
                  });
                }
              },
            ),

            const SizedBox(height: 24),

            // Skills
            const Text('Skills', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                SkillChip(label: 'Graphic'),
                SkillChip(label: 'Art'),
                SkillChip(label: 'ASP.Net'),
                SkillChip(label: 'PHP'),
                SkillChip(label: 'UI/UX'),
                SkillChip(label: 'Css'),
                SkillChip(label: 'HTML 5'),
              ],
            ),

            ]
        ),
      ),
    );
  }
}