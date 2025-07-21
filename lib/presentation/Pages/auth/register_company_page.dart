import 'package:flutter/material.dart';
import 'package:services_application/presentation/routes/app_routes.dart';
import 'package:services_application/presentation/widgets/Inputs/custom_text_field.dart';
import 'package:services_application/presentation/widgets/appear/custom_app_bar.dart';
import '../../../core/utils/app_colors.dart';
import '../../widgets/buttons/custom_next_button.dart';

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
                CustomTextField(controller: sizeController, hint: 'Company Size'),
                CustomTextField(
                  controller: descriptionController,
                  hint: 'Description',
                  maxLines: 3,
                ),
                const SizedBox(height: 24),
                
                CustomNextButton(
                 onPressed: () {
                   final companyData = {
                  'companyName': companyNameController.text,
                  'industry': industryController.text,
                  'year': yearController.text,
                  'tax': taxController.text,
                  'size': sizeController.text,
                  'description': descriptionController.text,
                   'userType': userType,
                    };

             Navigator.pushNamed(
              context,
             AppRoutes.companyContact,
            arguments: companyData,
                 );
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
