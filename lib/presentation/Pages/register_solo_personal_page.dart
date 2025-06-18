import 'package:flutter/material.dart';
import 'package:services_application/presentation/widgets/skills_input.dart';
import '../../core/utils/app_colors.dart';
import '../widgets/buildSelecetableoption.dart';
import '../widgets/custom_next_button.dart';
import '../widgets/custom_password.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gender_widget.dart';

class RegisterSoloPagePersonal extends StatefulWidget {
  const RegisterSoloPagePersonal({super.key});

  @override
  State<RegisterSoloPagePersonal> createState() => _RegisterSoloPagePersonalState();
}

class _RegisterSoloPagePersonalState extends State<RegisterSoloPagePersonal> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController preferredWorkController = TextEditingController();
  
  final TextEditingController skillController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  List<String> skills = [];
  String? selectedEducation;
  String selectedWorkType = 'Part Time';

  final List<String> educationOptions = [
    'High School',
    'Diploma',
    'Bachelor',
    'Master',
    'PhD'
  ];

  void addSkill(String skill) {
    if (skill.isNotEmpty && !skills.contains(skill)) {
      setState(() {
        skills.add(skill);
        skillController.clear();
      });
    }
  }

  @override
  void dispose() {
    jobTitleController.dispose();
    experienceController.dispose();
    
    skillController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
 String workType = 'Full Time';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                CustomTextField(controller: jobTitleController, hint: 'Job Title'),
                const SizedBox(height: 12),
                CustomTextField(controller: experienceController, hint: 'Years of Experience'),
                const SizedBox(height: 12),
               DropdownButtonFormField<String>(
  value: selectedEducation,
  decoration: InputDecoration(
    hintText: 'Education Level',
    filled: true,
    fillColor: Colors.grey.shade100,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12), 
      borderSide: BorderSide.none,
    ),
  ),
  icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
  dropdownColor: Colors.white,
  items: educationOptions.map((level) {
    return DropdownMenuItem(
      value: level,
      child: Text(level),
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      selectedEducation = value;
    });
  },
  validator: (value) => value == null ? 'Please select your education level' : null,
),
                
                const SizedBox(height: 12),
                CustomTextField(controller: preferredWorkController, hint: 'Preferred Work nature'),
                const SizedBox(height: 12),
               const Text('Preferred Work nature',style: TextStyle(color:AppColors.darkText,fontWeight:FontWeight.bold ),),
                Row(
                  children: [
                     Expanded(child: SelectableOptionWidget(
                      height: 70,
                      width: 70, 
                      icon:Icons.abc_outlined, onTap: () {  
                         setState(() {
                            workType = 'Part Time';
                          });
                      }, selected: workType=='part Time', title: 'Part Time',
                      

                    )),
                 Expanded(child:   SelectableOptionWidget(
                      height: 70,
                      width: 70, 
                      icon:Icons.abc_outlined, onTap: () {  
                         setState(() {
                            workType = 'Full Time';
                          });
                      }, selected: workType=='Full Time', title: 'Full Time',
                      

                    )),
                  ],
                ),

                const SizedBox(height: 12),
                 SkillsInput(),
                const SizedBox(height: 12),
                 CustomPasswordField(
                  controller: passwordController,
                  hint: 'Password',
                ),
                CustomPasswordField(
                    hint: 'Confirm Password',
                    controller: confirmPasswordController),
              
                CustomNextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/companyregistercontact');
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