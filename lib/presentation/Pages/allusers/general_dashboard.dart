

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:services_application/presentation/Pages/allusers/home_page.dart';
import 'package:services_application/presentation/Pages/allusers/settings.dart';
import 'package:services_application/presentation/Pages/provideruser/invetation_page.dart';
import 'package:services_application/presentation/widgets/appear/custom_bottom_nav.dart';

class GeneralDashboard extends StatefulWidget {
  const GeneralDashboard({super.key});

  @override
  State<GeneralDashboard> createState() => _GeneralDashboardState();
}

class _GeneralDashboardState extends State<GeneralDashboard> {
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
            ProfilePage1(userId: 'default user id'),
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
