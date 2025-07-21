import 'package:flutter/material.dart';
import 'package:services_application/presentation/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../widgets/Inputs/buildSelecetableoption.dart';
import '../../widgets/buttons/custom_next_button.dart';

class ProviderTypeSelectionPage extends StatefulWidget {
  const ProviderTypeSelectionPage({super.key});

  @override
  State<ProviderTypeSelectionPage> createState() =>
      _ProviderTypeSelectionPageState();
}

class _ProviderTypeSelectionPageState extends State<ProviderTypeSelectionPage> {
  String selectedServiceType = 'Provider'; // Default value
  late String userType;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is String) {
      userType = args;
    } else {
      userType = 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'MY',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          width: 40,
                          height: 6,
                          color: AppColors.yellowAccent,
                        ),
                      ],
                    ),
                    const Text(
                      'SERVICES',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Select your Type',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.lightText,
                ),
              ),
              const SizedBox(height: 24),

              // خيار Solo / Company
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectableOptionWidget(
                    title: 'Company',
                    icon: Icons.work_outline,
                    selected: selectedServiceType == 'Company',
                    onTap: () {
                      setState(() {
                        selectedServiceType = 'Company';
                      });
                    },
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SelectableOptionWidget(
                    title: 'Solo',
                    icon: Icons.person_outline,
                    selected: selectedServiceType == 'Solo',
                    onTap: () {
                      setState(() {
                        selectedServiceType = 'Solo';
                      });
                    },
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // زر التالي
              CustomNextButton(
                onPressed: () {
                  if (selectedServiceType == 'Company') {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.companyRegister,
                      arguments: userType,
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.registerSolo,
                      arguments: userType,
                    );
                  }
                },
                text: 'Next',
              ),

              const SizedBox(height: 20),

              // تسجيل دخول
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Have An Account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signIn);
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
