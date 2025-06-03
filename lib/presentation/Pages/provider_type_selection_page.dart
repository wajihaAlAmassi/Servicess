import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../widgets/buildSelecetableoption.dart';
import '../widgets/custom_next_button.dart';
// import '../../data/models/user_type_model.dart';
// import '../pages/next_page.dart';
// import '../pages/register_page.dart'; // صفحة إنشاء حساب

class ProviderTypeSelectionPage extends StatefulWidget {
  const ProviderTypeSelectionPage({super.key});

  @override
  State<ProviderTypeSelectionPage> createState() =>
      _UserTypeSelectionPageState();
}

class _UserTypeSelectionPageState extends State<ProviderTypeSelectionPage> {
  String selectedServiceType = 'Provide';

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
              const Text(
                'Select your Type',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.lightText,
                ),
              ),
              const SizedBox(height: 24),

              // خيارات النوع
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectableOption(
                    title: 'Company',
                    icon: Icons.work_outline,
                    selected: selectedServiceType == 'Company',
                    onTap: () {
                      setState(() {
                        selectedServiceType = 'Company';
                      });
                    },
                  ),
                  SelectableOption(
                    title: 'Solo',
                    icon: Icons.work_outline,
                    selected: selectedServiceType == 'Solo',
                    onTap: () {
                      setState(() {
                        selectedServiceType = 'Solo';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // زر التالي
              CustomNextButton(
                onPressed: () {
                  if (selectedServiceType == 'Company') {
                    Navigator.pushNamed(context, '/companyregister');
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const RegisterPage(),
                      //   ),
                      // );
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

  Widget _buildSelectableOption({
    required String title,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF636CD8) : AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderGrey),
        ),
        child: Column(
          children: [
            Icon(icon, size: 36, color: selected ? Colors.white : Colors.black),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: selected ? AppColors.white : AppColors.darkText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
