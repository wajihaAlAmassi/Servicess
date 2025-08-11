import 'package:flutter/material.dart';
import 'package:servicess/presentation/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../widgets/appear/custom_bottom_nav.dart';
import '../../widgets/Cards/service_card.dart';

class InvetationPage extends StatelessWidget {
  const InvetationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.darkText),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          'Face Book Social Media ...',
          style:
              TextStyle(color: AppColors.darkText, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: AppColors.darkText,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    ServiceCard(
                      timeAgo: '15',
                      title: 'FaceBook Social Media Design',
                      userName: 'Madeha Ahmed',
                      location: 'Lebanon ',
                      price: '1500/Month',
                      rating: 3,
                      description:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      avatarPath: 'assets/images/avatar.png',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.invitationDetails);
                      },
                    ),
                    const SizedBox(height: 10),
                    ServiceCard(
                      timeAgo: '10',
                      title: 'Instagram Campaign Design',
                      userName: 'Ali Khaled',
                      location: 'Palestine',
                      price: '1200/Month',
                      rating: 4,
                      description:
                          'Campaign design for Instagram. Reach and audience strategies.',
                      avatarPath: 'assets/images/avatar.png',
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.invitationDetails);
                      },
                    ),
                    const SizedBox(height: 10),
                    ServiceCard(
                      timeAgo: '30',
                      title: 'LinkedIn Branding Kit',
                      userName: 'Sara N.',
                      location: 'Egypt',
                      price: '1700/Month',
                      rating: 5,
                      description:
                          'Create a personal brand design and post templates for LinkedIn.',
                      avatarPath: 'assets/images/avatar.png',
                      onTap: () {
                        Navigator.pushNamed(context,  AppRoutes.invitationDetails);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
        // bottomNavigationBar:CustomBottomNav()
    
      // bottomNavigationBar:  CustomBottomNav(cureentIndex: 3, userType: 'Provider',),
    );
  }
}
