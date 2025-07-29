// lib/data/repositories/job_repository.dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:services_application/data/models/job_application_model.dart';
import 'package:services_application/data/models/job_model.dart';

class JobRepository {
  final String baseUrl = "http://10.0.2.2:8000/api";
  Future<List<JobModel>> getJobsByUserType(String userType) async {
    await Future.delayed(const Duration(seconds: 1));

    if (userType == 'provider') {
      return [];
    } else {
      return [
        JobModel(
          id: '1',
          title: 'Flutter Developer',
          description: 'Create mobile app for e-commerce',
          location: 'Jordan',
          requirements: ['Flutter', 'Firebase'],
          skills: ['Mobile Dev'],
          jobType: 'Full Time',
          workNature: 'Remote',
          salary: 1000,
          deadline: DateTime.now().add(Duration(days: 7)),
          requesterId: '4',
        ),
      ];
    }
  }

  Future<void> applyToJob(JobApplicationModel application) async {
    final response = await http.post(
      Uri.parse('$baseUrl/apply'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(application.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Falieng send request");
    }
  }

  Future<void> postJob(Map<String, dynamic> jobData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/jobs'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(jobData),
    );

    if (response.statusCode != 201) {
      throw Exception('fail post job');
    }
  }

  Future<List<JobModel>> getMyJobs(String userId, String userType) async {
    final response = await http.get(
      Uri.parse('$baseUrl/my-jobs?userId=$userId&userType=$userType'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((jobJson) => JobModel.fromJson(jobJson)).toList();
    } else {
      throw Exception('Failing uploading jobs');
    }
  }
}
