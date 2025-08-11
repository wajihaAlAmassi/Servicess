import 'package:flutter/material.dart';
import 'package:servicess/core/utils/app_colors.dart';
import 'package:servicess/presentation/Pages/Requister/requester_job_candidates.dart';
import 'package:servicess/presentation/Pages/Requister/requester_job_details_page.dart';
import 'package:servicess/presentation/Pages/Requister/requester_posted_jobs_page.dart';
import 'package:servicess/presentation/Pages/Requister/requister_profile_page.dart';
import 'package:servicess/presentation/Pages/allusers/home_page.dart';
import 'package:servicess/presentation/Pages/allusers/provider_profile.dart';
import 'package:servicess/presentation/Pages/allusers/requester_home_page.dart';
import 'package:servicess/presentation/Pages/allusers/settings.dart';
import 'package:servicess/presentation/Pages/provideruser/invetation_page.dart';
import 'package:servicess/presentation/Pages/provideruser/job_details_page.dart';
import 'package:servicess/presentation/routes/app_routes.dart';
import 'package:servicess/presentation/widgets/appear/custom_bottom_nav.dart';
import 'package:sidebarx/sidebarx.dart';

// class RequesterDashboard extends StatefulWidget {
//   const RequesterDashboard({super.key});

//   @override
//   State<RequesterDashboard> createState() =>
//       _RequesterDashboardState();
// }

// class _RequesterDashboardState extends State<RequesterDashboard> {
//   final SidebarXController _sidebarController = SidebarXController(
//     selectedIndex: 0,
//     extended: true,
//   );

//   final GlobalKey<ScaffoldState> _scaffoldKey =
//       GlobalKey<ScaffoldState>();
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   Widget _getScreenBySidebarIndex(int index) {
//     switch (index) {
//       case 0:
//         return ReqHomePage();
//       case 1:
//         return RequesterProfilePage();
//       case 2:
//         return InvetationPage();
//       default:
//         return Center(child: Text("Not Found"));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isSmallScreen = MediaQuery.of(context).size.width < 600;

//     return Scaffold(
//       key: _scaffoldKey,
//       appBar:
//           isSmallScreen
//               ? AppBar(
//                 backgroundColor: AppColors.primaryPink,
//                 title: AnimatedBuilder(
//                   animation: _sidebarController,
//                   builder: (context, _) {
//                     return Text(
//                       _getTitleByIndex(
//                         _sidebarController.selectedIndex,
//                       ),
//                       style: const TextStyle(color: Colors.white),
//                     );
//                   },
//                 ),
//                 leading: IconButton(
//                   icon: const Icon(Icons.menu),
//                   onPressed:
//                       () => _scaffoldKey.currentState?.openDrawer(),
//                 ),
//               )
//               : null,
//       drawer:
//           isSmallScreen
//               ? ExampleSidebarX(
//                 controller: _sidebarController,
//                 userType: "requester",
//               )
//               : null,
//       body: Row(
//         children: [
//           if (!isSmallScreen)
//             ExampleSidebarX(
//               controller: _sidebarController,
//               userType: "requester",
//             ),
//           Expanded(
//             child: _getScreenBySidebarIndex(
//               _sidebarController.selectedIndex,
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CustomBottomNav(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }

//   String _getTitleByIndex(int index) {
//     switch (index) {
//       case 0:
//         return 'Profile';
//       case 1:
//         return 'Invitations';
//       case 2:
//         return 'Jobs';
//       case 3:
//         return 'Saved Lists';
//       case 4:
//         return 'My Contracts';
//       case 5:
//         return 'Verify Account';
//       case 6:
//         return 'Policies';
//       case 7:
//         return 'Payment';
//       case 8:
//         return 'About Us';
//       case 9:
//         return 'Support';
//       default:
//         return 'Page';
//     }
//   }
// }

class RequesterDashboard extends StatefulWidget {
  const RequesterDashboard({super.key});

  @override
  State<RequesterDashboard> createState() =>
      _RequesterDashboardState();
}

class _RequesterDashboardState extends State<RequesterDashboard> {
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
            ReqHomePage(),
            /*
//! ProfileChanged
ProfilePage1(userId: "userId"),
ProfilePage(),
*/
            // RequesterJobCandidtatesPage(),
            RequesterJobDetailsPage(),
            SettingsPage(
              userType: 'requester',
              selectedServiceType: 'solo',
            ),
            // HomePage(),
            // ProfilePage1(userId: 'default user id'),
            // InvetationPage(),
            // SettingsPage(
            //   userType: 'Provider',
            //   selectedServiceType: 'Solo',
            // ),
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
