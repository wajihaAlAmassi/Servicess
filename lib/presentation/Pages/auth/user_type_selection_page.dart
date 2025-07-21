import 'package:flutter/material.dart';
import 'package:services_application/presentation/Pages/auth/signIn_page.dart';
import 'package:services_application/presentation/routes/app_routes.dart';

import '../../../core/utils/app_colors.dart';
import '../../widgets/Inputs/buildSelecetableoption.dart';
import '../../widgets/buttons/custom_next_button.dart';

// import '../../data/models/user_type_model.dart';
// import '../pages/next_page.dart';
// import '../pages/register_page.dart'; // صفحة إنشاء حساب

class UserTypeSelectionPage extends StatefulWidget {
  const UserTypeSelectionPage({super.key});

  @override
  State<UserTypeSelectionPage> createState() => _UserTypeSelectionPageState();
}

class _UserTypeSelectionPageState extends State<UserTypeSelectionPage> {
  
String? selectedUserType; // 'provider' أو 'requester'


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
                        // الشعار
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
                      ])),
              const SizedBox(height: 32),
              const SizedBox(height: 24),
              Center(
                child: const Text(
                  'Select your Type',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.lightText,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // خيارات النوع
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectableOptionWidget(
                    title: 'Need a Service',
                    icon: Icons.help_outline,
                    selected: selectedUserType == 'requester',
                    onTap: () {
                      setState(() {
                        selectedUserType = 'requester';
                      });
                    }, height: 120, width:  MediaQuery.of(context).size.width * 0.4,
                  ),
                  SelectableOptionWidget(
                    title: 'Provide A Service',
                    icon: Icons.work_outline,
                    selected: selectedUserType == 'Provider',
                    onTap: () {
                      setState(() {
                        selectedUserType = 'Provider';
                        
                      });
                    }, height: 120, width:  MediaQuery.of(context).size.width * 0.4,
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // زر التالي

              CustomNextButton(
               onPressed: () {
   if (selectedUserType != null) {
  if (selectedUserType == 'Provider') {
    Navigator.pushNamed(
      context,
      AppRoutes.providerType,
      arguments: selectedUserType,
    );
  } else if (selectedUserType == 'requester') {
    Navigator.pushNamed(
      context,
       AppRoutes.providerType,
      arguments: selectedUserType,
    );
  }
}

  },
  text: 'Next',

                
              ),

              const SizedBox(height: 20),

              // رابط إنشاء حساب
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
