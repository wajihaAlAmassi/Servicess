import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../widgets/custom_next_button.dart';
import '../widgets/custom_text_field.dart';

class CompanyRegisterPage extends StatefulWidget {
  const CompanyRegisterPage({super.key});

  @override
  State<CompanyRegisterPage> createState() => _CompanyRegisterPageState();
}

class _CompanyRegisterPageState extends State<CompanyRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController industryController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController taxController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  'Sign up to your Company',
                  style: TextStyle(color: AppColors.lightText),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                    controller: companyNameController, hint: 'Company Name'),
                CustomTextField(
                    controller: industryController, hint: 'Industry'),
                CustomTextField(
                    controller: yearController, hint: 'Year Of Establishment'),
                CustomTextField(controller: taxController, hint: 'Tax Licence'),
                CustomTextField(
                    controller: sizeController, hint: 'Company Size'),
                CustomTextField(
                    controller: descriptionController,
                    hint: 'Description',
                    maxLines: 3),
                const SizedBox(height: 24),
                CustomNextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/companyregistercontact');
                  }, text: 'Next',
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
          fillColor: AppColors.borderGrey,
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
    companyNameController.dispose();
    industryController.dispose();
    yearController.dispose();
    taxController.dispose();
    sizeController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
