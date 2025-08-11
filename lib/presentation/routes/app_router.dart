

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicess/data/repositories/auth_repository.dart';
import 'package:servicess/presentation/Pages/Requister/candidates_page.dart';
import 'package:servicess/presentation/Pages/Requister/post_job_page.dart';
import 'package:servicess/presentation/Pages/Requister/requester_job_candidates.dart';
import 'package:servicess/presentation/Pages/Requister/requester_job_details_page.dart';
import 'package:servicess/presentation/Pages/Requister/requester_posted_jobs_page.dart';
import 'package:servicess/presentation/Pages/allusers/home_page.dart';
import 'package:servicess/presentation/Pages/allusers/my_contact_page.dart';
import 'package:servicess/presentation/Pages/allusers/provider_profile.dart';
import 'package:servicess/presentation/Pages/allusers/requester_home_page.dart';
import 'package:servicess/presentation/Pages/allusers/splash_page.dart';
import 'package:servicess/presentation/Pages/auth/provider_type_selection_page.dart';
import 'package:servicess/presentation/Pages/auth/register_company_contact_page.dart';
import 'package:servicess/presentation/Pages/auth/register_company_page.dart';
import 'package:servicess/presentation/Pages/auth/register_solo_page.dart';
import 'package:servicess/presentation/Pages/auth/register_solo_personal_page.dart';
import 'package:servicess/presentation/Pages/auth/signIn_page.dart';
import 'package:servicess/presentation/Pages/auth/user_type_selection_page.dart';
import 'package:servicess/presentation/Pages/auth/verification_page.dart';
import 'package:servicess/presentation/Pages/provideruser/apply_service.dart';
import 'package:servicess/presentation/Pages/provideruser/invetation_details_page.dart';
import 'package:servicess/presentation/Pages/provideruser/invetation_page.dart';
import 'package:servicess/presentation/Pages/provideruser/job_details_page.dart';
import 'package:servicess/presentation/Pages/provideruser/my_jobs_page.dart';
import 'package:servicess/presentation/bloc/auth/auth_bloc.dart';


import 'package:servicess/presentation/routes/app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(settings: settings,builder: (_) => const SplashPage());

// 
  //   case AppRoutes.requesterProfile:
  // return MaterialPageRoute(settings: settings,
  //   builder: (_) => BlocProvider(
  //     create: (_) => AuthBloc(authRepository: AuthRepository()),
  //     child: const SignInPage(),
  //   ),
  // );
    case AppRoutes.signIn:
  return MaterialPageRoute(settings: settings,
    builder: (_) => BlocProvider(
      create: (_) => AuthBloc(authRepository: AuthRepository()),
      child: const SignInPage(),
    ),
  );


      case AppRoutes.userType:
        return MaterialPageRoute(settings: settings,builder: (_) => const UserTypeSelectionPage());

      case AppRoutes.providerType:
        return MaterialPageRoute(settings: settings,builder: (_) => const EntityTypeSelectionPage());

      case AppRoutes.companyRegister:
      return MaterialPageRoute(settings: settings,
         builder: (_) => BlocProvider(
          create: (_) => AuthBloc(authRepository: AuthRepository()),
          child: const CompanyRegisterPage(), 
        ),
           );
       

      case AppRoutes.companyContact:
      return MaterialPageRoute(settings: settings,
         builder: (_) => BlocProvider(
          create: (_) => AuthBloc(authRepository: AuthRepository()),
          child: const CompanyRegisterContactPage(), 
        ),
           );
        

      case AppRoutes.providerHome:
        return MaterialPageRoute(settings: settings,builder: (_) => const HomePage());
         case AppRoutes.requesterHome:
        return MaterialPageRoute(settings: settings,builder: (_) => const ReqHomePage());
      case AppRoutes.jobDetails:
        return MaterialPageRoute(settings: settings,builder: (_) => const JobDetailPage());

      case AppRoutes.applyService:
        return MaterialPageRoute(settings: settings,builder: (_) => const ApplyServicePage());

      case AppRoutes.profile:
        return MaterialPageRoute(settings: settings,builder: (_) => const ProviderProfilePage()); //ProfilePage()

      case AppRoutes.invitations:
        return MaterialPageRoute(settings: settings,builder: (_) => const InvetationPage());

      case AppRoutes.invitationDetails:
        return MaterialPageRoute(settings: settings,builder: (_) => const InvitationDetailsPage(invitationId: '',));

      case AppRoutes.myJob:
        return MaterialPageRoute(settings: settings,builder: (_) => const MyJobsPage());

      case AppRoutes.myContact:
        return MaterialPageRoute(settings: settings,builder: (_) => MyContactPage());

      case AppRoutes.registerSolo:
        return MaterialPageRoute(settings: settings,
         builder: (_) => BlocProvider(
          create: (_) => AuthBloc(authRepository: AuthRepository()),
          child: const RegisterSoloPage(), 
        ),
           );


      case AppRoutes.registerSoloPersonal:
      return MaterialPageRoute(settings: settings,
         builder: (_) => BlocProvider(
          create: (_) => AuthBloc(authRepository: AuthRepository()),
          child: const RegisterSoloPagePersonal(), 
        ),
           );
       

 
    case AppRoutes.verifyOtp:
      return MaterialPageRoute(settings: settings,
       builder: (_) => BlocProvider(
       create: (_) => AuthBloc(authRepository: AuthRepository()),
       child: const VerifyOtpPage(),
    ),
  );

       

      case AppRoutes.candidates:
        return MaterialPageRoute(settings: settings,builder: (_) => const CandidatesPage());

      case AppRoutes.postJob:
        return MaterialPageRoute(settings: settings,builder: (_) => const PostJopPage());

      case AppRoutes.requesterJobCandidates:
        return MaterialPageRoute(settings: settings,builder: (_) => RequesterJobCandidtatesPage());

      case AppRoutes.requesterJobDetails:
        return MaterialPageRoute(settings: settings,builder: (_) => const RequesterJobDetailsPage());

      case AppRoutes.requesterPostedJobs:
        return MaterialPageRoute(settings: settings,builder: (_) => const requester_posted_jobs_page());

      default:
        return MaterialPageRoute(settings: settings,
          builder: (_) => const Scaffold(
            body: Center(child: Text("Page not found")),
          ),
        );
    }
  }
}
