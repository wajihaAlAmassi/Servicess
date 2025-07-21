

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services_application/data/repositories/auth_repository.dart';
import 'package:services_application/presentation/Pages/Requister/candidates_page.dart';
import 'package:services_application/presentation/Pages/Requister/post_job_page.dart';
import 'package:services_application/presentation/Pages/Requister/requester_job_candidates.dart';
import 'package:services_application/presentation/Pages/Requister/requester_job_details_page.dart';
import 'package:services_application/presentation/Pages/Requister/requester_posted_jobs_page.dart';
import 'package:services_application/presentation/Pages/allusers/home_page.dart';
import 'package:services_application/presentation/Pages/allusers/my_contact_page.dart';
import 'package:services_application/presentation/Pages/allusers/provider_profile.dart';
import 'package:services_application/presentation/Pages/allusers/splash_page.dart';
import 'package:services_application/presentation/Pages/auth/provider_type_selection_page.dart';
import 'package:services_application/presentation/Pages/auth/register_company_contact_page.dart';
import 'package:services_application/presentation/Pages/auth/register_company_page.dart';
import 'package:services_application/presentation/Pages/auth/register_solo_page.dart';
import 'package:services_application/presentation/Pages/auth/register_solo_personal_page.dart';
import 'package:services_application/presentation/Pages/auth/signIn_page.dart';
import 'package:services_application/presentation/Pages/auth/user_type_selection_page.dart';
import 'package:services_application/presentation/Pages/auth/verification_page.dart';
import 'package:services_application/presentation/Pages/provideruser/apply_service.dart';
import 'package:services_application/presentation/Pages/provideruser/invetation_details_page.dart';
import 'package:services_application/presentation/Pages/provideruser/invetation_page.dart';
import 'package:services_application/presentation/Pages/provideruser/job_details_page.dart';
import 'package:services_application/presentation/Pages/provideruser/my_jobs_page.dart';
import 'package:services_application/presentation/bloc/auth/auth_bloc.dart';


import 'package:services_application/presentation/routes/app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());

    case AppRoutes.signIn:
  return MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (_) => AuthBloc(authRepository: AuthRepository()),
      child: const SignInPage(),
    ),
  );


      case AppRoutes.userType:
        return MaterialPageRoute(builder: (_) => const UserTypeSelectionPage());

      case AppRoutes.providerType:
        return MaterialPageRoute(builder: (_) => const ProviderTypeSelectionPage());

      case AppRoutes.companyRegister:
      return MaterialPageRoute(
         builder: (_) => BlocProvider(
          create: (_) => AuthBloc(authRepository: AuthRepository()),
          child: const CompanyRegisterPage(), 
        ),
           );
       

      case AppRoutes.companyContact:
      return MaterialPageRoute(
         builder: (_) => BlocProvider(
          create: (_) => AuthBloc(authRepository: AuthRepository()),
          child: const CompanyRegisterContactPage(), 
        ),
           );
        

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomePage());

      case AppRoutes.jobDetails:
        return MaterialPageRoute(builder: (_) => JobDetailPage());

      case AppRoutes.applyService:
        return MaterialPageRoute(builder: (_) => ApplyServicePage());

      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => ProfilePage());

      case AppRoutes.invitations:
        return MaterialPageRoute(builder: (_) => InvetationPage());

      case AppRoutes.invitationDetails:
        return MaterialPageRoute(builder: (_) => InvitationDetailsPage());

      case AppRoutes.myJob:
        return MaterialPageRoute(builder: (_) => MyJobsPage());

      case AppRoutes.myContact:
        return MaterialPageRoute(builder: (_) => MyContactPage());

      case AppRoutes.registerSolo:
        return MaterialPageRoute(
         builder: (_) => BlocProvider(
          create: (_) => AuthBloc(authRepository: AuthRepository()),
          child: const RegisterSoloPage(), 
        ),
           );


      case AppRoutes.registerSoloPersonal:
      return MaterialPageRoute(
         builder: (_) => BlocProvider(
          create: (_) => AuthBloc(authRepository: AuthRepository()),
          child: const RegisterSoloPagePersonal(), 
        ),
           );
       

 
    case AppRoutes.verifyOtp:
      return MaterialPageRoute(
       builder: (_) => BlocProvider(
       create: (_) => AuthBloc(authRepository: AuthRepository()),
       child: const VerifyOtpPage(),
    ),
  );

       

      case AppRoutes.candidates:
        return MaterialPageRoute(builder: (_) => CandidatesPage());

      case AppRoutes.postJob:
        return MaterialPageRoute(builder: (_) => PostJopPage());

      case AppRoutes.requesterJobCandidates:
        return MaterialPageRoute(builder: (_) => RequesterJobCandidtatesPage());

      case AppRoutes.requesterJobDetails:
        return MaterialPageRoute(builder: (_) => RequesterJobDetailsPage());

      case AppRoutes.requesterPostedJobs:
        return MaterialPageRoute(builder: (_) => requester_posted_jobs_page());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Page not found")),
          ),
        );
    }
  }
}
