import 'package:flutter/material.dart';
import 'package:services_application/presentation/widgets/Inputs/custom_text_box.dart';
import 'package:services_application/presentation/widgets/buttons/custom_next_button.dart';

import 'package:services_application/presentation/widgets/Inputs/skills_input.dart';

class CandidatesPage extends StatelessWidget {
  TextEditingController q1Controller = TextEditingController();
  TextEditingController q2Controller = TextEditingController();
  TextEditingController q3Controller = TextEditingController();

  CandidatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Post a Job"))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(child: Text("Add A Question")),
            SizedBox(height: 30),
            CustomTextBox(
              controller: q1Controller,
              hint: "Question 1",
            ),
            SizedBox(height: 30),
            CustomTextBox(
              controller: q2Controller,
              hint: "Question 2",
            ),
            SizedBox(height: 30),
            CustomTextBox(
              controller: q3Controller,
              hint: "Question 3",
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SkillsInput(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: CustomNextButton(
                onPressed: () {},
                text: "post the job",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
