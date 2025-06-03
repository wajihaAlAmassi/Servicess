import 'package:flutter/material.dart';
import 'package:services_application/core/utils/app_colors.dart';
import 'package:services_application/presentation/widgets/custom_next_button.dart';
import '../widgets/custom_text_box.dart'; // غيّر المسار حسب مجلد التخزين

class ApplyServicePage extends StatelessWidget {
  final TextEditingController q1 = TextEditingController();
  final TextEditingController q2 = TextEditingController();
  final TextEditingController q3 = TextEditingController();

  ApplyServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.darkText),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          'Face Book Social Media ...',
          style: TextStyle(color: AppColors.darkText, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Answer This Questions',
                style: TextStyle(color: AppColors.lightText),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextBox(controller: q1, hint: 'Question One'),
            CustomTextBox(controller: q2, hint: 'Question Two'),
            CustomTextBox(controller: q3, hint: 'Question Three'),
            const Spacer(),
            CustomNextButton(onPressed: () {}, text: 'Send')
          ],
        ),
      ),
    );
  }
}
