import 'package:flutter/material.dart';
import 'package:services_application/core/utils/app_colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/service_card.dart';
import '../widgets/custom_bottom_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const CustomAppBar(),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SearchBarWidget(),
          ),
          const SizedBox(height: 8),
          Expanded(child: ListView(
            children: [
              Column(
                children: [
                  ServiceCard(
                     onTap:  (){  Navigator.pushNamed(context, '/jobdetails');},
                            timeAgo: '15',
                            title: 'FaceBook Social Media Design',
                            userName: 'Madeha Ahmed',
                            location: 'Lebanon ',
                            price: '1500/Month',
                            rating: 3,
                            description:
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry . lorem Ipsum has been the industry standard dummy text ever since the 1500S',
                            avatarPath: 'assets/images/avatar.png'),
                            SizedBox(height: 10,),
                            ServiceCard(
                                 onTap:  (){  Navigator.pushNamed(context, '/jobdetails');},
                            timeAgo: '15',
                            title: 'FaceBook Social Media Design',
                            userName: 'Madeha Ahmed',
                            location: 'Lebanon ',
                            price: '1500/Month',
                            rating: 3,
                            description:
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry . lorem Ipsum has been the industry standard dummy text ever since the 1500S',
                            avatarPath: 'assets/images/avatar.png'),
                            SizedBox(height: 10,),
                            ServiceCard(
                                 onTap:  (){  Navigator.pushNamed(context, '/jobdetails');},
                            timeAgo: '15',
                            title: 'FaceBook Social Media Design',
                            userName: 'Madeha Ahmed',
                            location: 'Lebanon ',
                            price: '1500/Month',
                            rating: 3,
                            description:
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry . lorem Ipsum has been the industry standard dummy text ever since the 1500S',
                            avatarPath: 'assets/images/avatar.png'),
                            SizedBox(height: 10,),
                            ServiceCard(
                                 onTap:  (){  Navigator.pushNamed(context, '/jobdetails');},
                            timeAgo: '15',
                            title: 'FaceBook Social Media Design',
                            userName: 'Madeha Ahmed',
                            location: 'Lebanon ',
                            price: '1500/Month',
                            rating: 3,
                            description:
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry . lorem Ipsum has been the industry standard dummy text ever since the 1500S',
                            avatarPath: 'assets/images/avatar.png'),
                ],
              )
            ],
          )
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}
