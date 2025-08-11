import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicess/core/utils/app_colors.dart';
import 'package:servicess/data/models/job_application_model.dart';
import 'package:servicess/presentation/bloc/job/job_bloc.dart';
import 'package:servicess/presentation/bloc/job/job_event.dart';
import 'package:servicess/presentation/bloc/job/job_state.dart';
import 'package:servicess/presentation/widgets/Inputs/custom_text_box.dart';
import 'package:servicess/presentation/widgets/accsess/wrapper_widget.dart';
import 'package:servicess/presentation/widgets/buttons/custom_next_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplyServicePage extends StatefulWidget {
  const ApplyServicePage({super.key});

  @override
  State<ApplyServicePage> createState() => _ApplyServicePageState();
}

class _ApplyServicePageState extends State<ApplyServicePage> {
  final TextEditingController q1 = TextEditingController();
  final TextEditingController q2 = TextEditingController();
  final TextEditingController q3 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkUserType();
  }

  Future<void> _checkUserType() async {
    final prefs = await SharedPreferences.getInstance();
    final userType = prefs.getString('user_type');

    if (userType != 'provider') {
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('هذه الصفحة مخصصة لمزودي الخدمات فقط')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProviderOnly(
    child:BlocListener<JobBloc, JobState>(
      listener: (context, state) {
        if (state is JobApplySuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Apply Success')),
          );
          Navigator.pop(context);
        } else if (state is JobError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
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
            style: TextStyle(
                color: AppColors.darkText, fontWeight: FontWeight.bold),
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
              CustomNextButton(
                onPressed: () {
                  final application = JobApplicationModel(
                    jobId: 1,
                    providerId: '4',
                    answer1: q1.text,
                    answer2: q2.text,
                    answer3: q3.text,
                  );
                  context.read<JobBloc>().add(ApplyToJobPressed(application));
                },
                text: 'Send',
              )
            ],
          ),
        ),
      ),
    ));
  }
}
