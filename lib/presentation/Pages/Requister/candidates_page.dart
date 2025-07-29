import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services_application/data/models/job_storage.dart';
import 'package:services_application/presentation/bloc/job/job_bloc.dart';
import 'package:services_application/presentation/bloc/job/job_event.dart';
import 'package:services_application/presentation/bloc/job/job_state.dart';
import 'package:services_application/presentation/widgets/Inputs/custom_text_box.dart';
import 'package:services_application/presentation/widgets/buttons/custom_next_button.dart';
import 'package:services_application/presentation/widgets/Inputs/skills_input.dart';

class CandidatesPage extends StatefulWidget {

  const CandidatesPage({
    super.key,
  
  });

  @override
  State<CandidatesPage> createState() => _CandidatesPageState();
}

class _CandidatesPageState extends State<CandidatesPage> {
  final TextEditingController q1Controller = TextEditingController();
  final TextEditingController q2Controller = TextEditingController();
  final TextEditingController q3Controller = TextEditingController();

  @override
  void dispose() {
    q1Controller.dispose();
    q2Controller.dispose();
    q3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      final storage = JobFormStorage();
    return BlocListener<JobBloc, JobState>(
  listener: (context, state) {
    if (state is JobPostedSuccessfully) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("تم نشر الوظيفة بنجاح")),
      );
      Navigator.pop(context);
    } else if (state is JobError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  },
  child:  Scaffold(
      appBar: AppBar(title: const Center(child: Text("Post a Job"))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Center(child: Text("Add A Question")),
            const SizedBox(height: 30),
            CustomTextBox(
              controller: q1Controller,
              hint: "Question 1",
            ),
            const SizedBox(height: 30),
            CustomTextBox(
              controller: q2Controller,
              hint: "Question 2",
            ),
            const SizedBox(height: 30),
            CustomTextBox(
              controller: q3Controller,
              hint: "Question 3",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SkillsInput(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: CustomNextButton(
                onPressed: () {
               
                 storage.jobData.q1 = q1Controller.text;
                  storage.jobData.q2 = q2Controller.text;
                  storage.jobData.q3 = q3Controller.text;

                  final jobData = {
                    "title": storage.jobData.title,
                    "category": storage.jobData.category,
                    "country": storage.jobData.country,
                    "city": storage.jobData.city,
                    "salary": storage.jobData.salary,
                    "job_type": storage.jobData.jobType,
                    "workspace": storage.jobData.workspace,
                    "q1": storage.jobData.q1,
                    "q2": storage.jobData.q2,
                    "q3": storage.jobData.q3,
                  };

                  context.read<JobBloc>().add(PostJobPressed(jobData));
                // Send jobData to repository
            
                
                },
                text: "Post the Job",
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
