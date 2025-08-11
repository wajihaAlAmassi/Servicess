import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servicess/data/models/job_storage.dart';
// import 'package:servicess/presentation/Pages/Requister/candidates_page.dart';
// import 'package:servicess/presentation/bloc/job/job_bloc.dart';
// import 'package:servicess/presentation/bloc/job/job_event.dart';
// import 'package:servicess/presentation/bloc/job/job_state.dart';
import 'package:servicess/presentation/routes/app_routes.dart';
import 'package:servicess/presentation/widgets/Inputs/buildSelecetableoption.dart';
import 'package:servicess/presentation/widgets/Inputs/custom_text_field.dart';
import 'package:servicess/presentation/widgets/appear/counter_ranger_packer_widgets.dart';
import 'package:servicess/presentation/widgets/buttons/custom_next_button.dart';

class PostJopPage extends StatefulWidget {
  const PostJopPage({super.key});

  @override
  State<PostJopPage> createState() => _PostJopPageState();
}

class _PostJopPageState extends State<PostJopPage> {
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController jobCategoryController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController salaryRangeController = TextEditingController();
  List<String> jobTypeOptions = [
    'Full Time',
    'Part Time',
    'Freelancer',
  ];
  List<String> workSpaceOptions = ['On Site', 'Remote', 'Hybrid'];
  int selectedJobTypeIndex = 0;
  int selectedWorkSpaceIndex = 0;

  @override
  Widget build(BuildContext context) {
   
      return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Post a Job"))),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: jobTitleController,
                hint: "Job Title",
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: jobCategoryController,
                hint: "Job Category",
              ),
              const SizedBox(height: 10),
              ...buildSelectableOptionGroup(
                title: "Job Type",
                options: jobTypeOptions,
                selectedIndex: selectedJobTypeIndex,
                onSelect: (index) =>
                    setState(() => selectedJobTypeIndex = index),
              ),
              const SizedBox(height: 10),
              ...buildSelectableOptionGroup(
                title: "Work Space",
                options: workSpaceOptions,
                selectedIndex: selectedWorkSpaceIndex,
                onSelect: (index) =>
                    setState(() => selectedWorkSpaceIndex = index),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: countryController,
                hint: "Country",
              ),
              const SizedBox(height: 10),
              CustomTextField(controller: cityController, hint: "City"),
              const SizedBox(height: 10),
              const Text(
                "Years of Experience",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              CounterRangePicker(),
              const SizedBox(height: 10),
              CustomTextField(
                controller: salaryRangeController,
                hint: "Salary Range",
              ),
              const SizedBox(height: 20),
              CustomNextButton(
                onPressed: () {
        final storage = JobFormStorage();

  storage.jobData.title = jobTitleController.text;
  storage.jobData.category = jobCategoryController.text;
  storage.jobData.country = countryController.text;
  storage.jobData.city = cityController.text;
  storage.jobData.salary = salaryRangeController.text;
  storage.jobData.jobType = jobTypeOptions[selectedJobTypeIndex];
  storage.jobData.workspace = workSpaceOptions[selectedWorkSpaceIndex];

  Navigator.pushNamed(context, AppRoutes.candidates);
                },
                text: "Next",
              ),
            ],
          ),
        ),
      );
    
  }

  List<Widget> buildSelectableOptionGroup({
    required String title,
    required List<String> options,
    required int selectedIndex,
    required Function(int) onSelect,
  }) {
    return [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      const SizedBox(height: 10),
      Row(
        children: List.generate(options.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SelectableOptionWidget(
              title: options[index],
              selected: selectedIndex == index,
              onTap: () => onSelect(index),
              width: index == 2 ? 120 : 100,
              height: 55,
            ),
          );
        }),
      ),
    ];
  }
}
