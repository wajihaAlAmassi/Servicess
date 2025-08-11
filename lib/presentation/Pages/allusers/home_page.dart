import 'package:flutter/material.dart';
import 'package:servicess/core/utils/app_colors.dart';
import '../../widgets/appear/custom_app_bar.dart';
import '../../widgets/Inputs/search_bar.dart';
import '../../widgets/Cards/service_card.dart';
import '../../widgets/appear/custom_bottom_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF4CB1),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                ),
                child: const CustomAppBar(),
              ),
              const SizedBox(height: 36),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    ServiceCard(
                      onTap: () {
                        Navigator.pushNamed(context, '/jobdetails');
                      },
                      timeAgo: '15',
                      title: 'FaceBook Social Media Design',
                      userName: 'Madeha Ahmed',
                      location: 'Lebanon',
                      price: '1500/Month',
                      rating: 3,
                      description:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      avatarPath: 'assets/images/avatar.png',
                    ),
                    const SizedBox(height: 10),
                    ServiceCard(
                      onTap: () {
                        Navigator.pushNamed(context, '/jobdetails');
                      },
                      timeAgo: '15',
                      title: 'FaceBook Social Media Design',
                      userName: 'Madeha Ahmed',
                      location: 'Lebanon',
                      price: '1500/Month',
                      rating: 3,
                      description:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      avatarPath: 'assets/images/avatar.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Positioned(
            top: 120,
            left: 20,
            right: 20,
            child: SearchBarWidget(),
          ),
        ],
      ),
      //  we dont need them anymore!!
        // bottomNavigationBar:CustomBottomNav()
    
      // bottomNavigationBar:  CustomBottomNav(cureentIndex: 0, userType: 'requester',),//  default value here until you call args
    );
  }
}