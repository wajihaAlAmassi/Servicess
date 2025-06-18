import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../widgets/custom_next_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gender_widget.dart';

class RegisterSoloPage extends StatefulWidget {
  const RegisterSoloPage({super.key});

  @override
  State<RegisterSoloPage> createState() => _RegisterSoloPageState();
}

class _RegisterSoloPageState extends State<RegisterSoloPage> {
  final _formKey = GlobalKey<FormState>();
  Gender? selectedGender;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    ageController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    cityController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

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
          'Solo Sign Up',
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
                  'Sign up to your Solo',
                  style: TextStyle(color: AppColors.lightText),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                    controller: fullNameController, hint: 'Full Name'),
                const SizedBox(height: 12),
                CustomTextField(controller: ageController, hint: 'Age'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            controller: genderController, hint: 'gender')),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: GenderSelector(
                      selectedGender: selectedGender,
                      onChanged: (gender) {
                        setState(() {
                          selectedGender = gender;
                        });
                      },
                    )),
                  ],
                ),
                const SizedBox(height: 12),
                CustomTextField(controller: emailController, hint: 'Email'),
                const SizedBox(height: 12),
                CustomTextField(
                    controller: phoneNumberController, hint: 'Phone Number'),
                const SizedBox(height: 12),
                CustomTextField(
                    controller: cityController, hint: 'City/Country'),
                const SizedBox(height: 12),
                CustomTextField(
                    controller: zipCodeController, hint: 'Zip Code'),
                const SizedBox(height: 24),
                CustomNextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registersoloPersonal');
                  },
                  text: 'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
