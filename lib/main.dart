import 'package:flutter/material.dart';
import 'package:services_application/presentation/Pages/apply_service.dart';
import 'package:services_application/presentation/Pages/home_page.dart';
import 'package:services_application/presentation/Pages/invetation_details_page.dart';
import 'package:services_application/presentation/Pages/invetation_page.dart';
import 'package:services_application/presentation/Pages/job_details_page.dart';
import 'package:services_application/presentation/Pages/my_contact_page.dart';
import 'package:services_application/presentation/Pages/my_jobs_page.dart';
import 'package:services_application/presentation/Pages/provider_profile.dart';
import 'package:services_application/presentation/Pages/provider_type_selection_page.dart';
import 'package:services_application/presentation/Pages/register_company_contact_page.dart';
import 'package:services_application/presentation/Pages/register_company_page.dart';
import 'package:services_application/presentation/Pages/register_solo_page.dart';
import 'package:services_application/presentation/Pages/register_solo_personal_page.dart';
import 'package:services_application/presentation/Pages/signIn_page.dart';
import 'package:services_application/presentation/Pages/user_type_selection_page.dart';
import 'package:services_application/presentation/Pages/verification_page.dart';

import 'presentation/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Services App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/signin': (context) => const SignInPage(),
          '/usertype': (context) => const UserTypeSelectionPage(),
          '/providertype': (context) => const ProviderTypeSelectionPage(),
          '/companyregister': (context) => const CompanyRegisterPage(),
          '/companyregistercontact': (context) =>
              const CompanyRegisterContactPage(),
          '/homepage': (context) => HomePage(),
          '/jobdetails': (context) => JobDetailPage(),
          '/applyservice': (context) => ApplyServicePage(),
          '/profilepage': (context) => ProfilePage(),
          '/myinvetation': (context) => InvetationPage(),
          '/invetationdetails': (context) => InvitationDetailsPage(),
          '/myjob': (context) => MyJobsPage(),
          '/mycontact': (contaxt) => MyContactPage(),
          '/registersolo': (context) => RegisterSoloPage(),
          '/registersoloPersonal': (context) => RegisterSoloPagePersonal(),
          '/verify':(context)=>VerifyOtpPage(),
        });
  }
}
