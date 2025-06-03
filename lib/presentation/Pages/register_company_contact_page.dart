import 'package:flutter/material.dart';
import 'package:services_application/core/utils/app_colors.dart';

import '../widgets/custom_next_button.dart';
import '../widgets/custom_password.dart';
import '../widgets/custom_text_field.dart';

class CompanyRegisterContactPage extends StatefulWidget {
  const CompanyRegisterContactPage({super.key});

  @override
  State<CompanyRegisterContactPage> createState() =>
      _CompanyRegisterContactPageState();
}

class _CompanyRegisterContactPageState
    extends State<CompanyRegisterContactPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController companyEmailController = TextEditingController();
  final TextEditingController phoneNummberController = TextEditingController();
  final TextEditingController cityCountryController = TextEditingController();
  final TextEditingController detailedAddressController =
      TextEditingController();
  final TextEditingController posterCardController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.darkText),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Company Sign Up',
          style: TextStyle(color: AppColors.darkText),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign up to your Contact',
                  style: TextStyle(color: AppColors.lightText),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                    controller: companyEmailController, hint: 'Email'),
                CustomTextField(
                    controller: phoneNummberController, hint: 'Phone Nummber'),
                CustomTextField(
                    controller: cityCountryController, hint: 'City Country'),
                CustomTextField(
                    controller: detailedAddressController,
                    hint: 'Detailed Address'),
                CustomTextField(
                    controller: posterCardController, hint: 'Poster Card'),
                CustomPasswordField(
                  controller: passwordController,
                  hint: 'Password',
                ),
                CustomPasswordField(
                    hint: 'Confirm Password',
                    controller: confirmPasswordController),
                const SizedBox(height: 24),
                CustomNextButton(
                  onPressed: () {},
                  text: 'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: AppColors.greyBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? 'Required' : null,
      ),
    );
  }

  @override
  void dispose() {
    companyEmailController.dispose();
    phoneNummberController.dispose();
    cityCountryController.dispose();
    detailedAddressController.dispose();
    posterCardController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
