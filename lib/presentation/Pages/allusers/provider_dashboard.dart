import 'package:flutter/material.dart';
import 'package:servicess/presentation/Pages/Requister/requister_profile_page.dart';
import 'package:servicess/presentation/Pages/allusers/home_page.dart';
import 'package:servicess/presentation/Pages/allusers/provider_profile.dart';
import 'package:servicess/presentation/Pages/allusers/settings.dart';
import 'package:servicess/presentation/Pages/provideruser/invetation_page.dart';
import 'package:servicess/presentation/Pages/provideruser/job_details_page.dart';
import 'package:servicess/presentation/widgets/appear/custom_bottom_nav.dart';

class ProviderDashboard extends StatefulWidget {
  const ProviderDashboard({super.key});

  @override
  State<ProviderDashboard> createState() => _ProviderDashboardState();
}

class _ProviderDashboardState extends State<ProviderDashboard> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Gradient background using your gold/bronze tones
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF7EEDD), // pastel beige (matches gold)
              Color(0xFFFDF6EE), // lighter peach
              Colors.white,
            ],
          ),
        ),
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            HomePage(),
            ProviderProfilePage(),
            // ProfilePage1(userId: 'default user id'),
            InvetationPage(),
            SettingsPage(
              userType: 'Provider',
              selectedServiceType: 'Solo',
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

      ),
    );
  }
}
