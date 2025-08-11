import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicess/data/repositories/auth_repository.dart';
import 'package:servicess/injection_container.dart';
import 'package:servicess/presentation/Pages/allusers/provider_dashboard.dart';
import 'package:servicess/presentation/Pages/provideruser/invetation_page.dart';
import 'package:servicess/presentation/bloc/auth/auth_bloc.dart';
import 'package:servicess/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:servicess/presentation/routes/app_router.dart';
import 'package:servicess/presentation/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialaizedDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  final AuthRepository authRepository = AuthRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserProfileBloc>(
          create: (_) => sl<UserProfileBloc>(),
        ),
        BlocProvider<AuthBloc>(
          create:
              (context) => AuthBloc(authRepository: authRepository),
        ),
      ],
      //  child: MaterialApp(home: GeneralDashboard(),)
      child: const MaterialApp(
        title: 'Services App',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
// ProfilePage() for requester page