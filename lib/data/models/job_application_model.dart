class JobApplicationModel {
  final String id;
  final String jobId;
  final String providerId;
  final String coverLetter;
  final DateTime submittedAt;
  final String status;

  JobApplicationModel({
    required this.id,
    required this.jobId,
    required this.providerId,
    required this.coverLetter,
    required this.submittedAt,
    required this.status,
  });

  factory JobApplicationModel.fromJson(Map<String, dynamic> json) =>
      JobApplicationModel(
        id: json['id'],
        jobId: json['jobId'],
        providerId: json['providerId'],
        coverLetter: json['coverLetter'],
        submittedAt: DateTime.parse(json['submittedAt']),
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'jobId': jobId,
        'providerId': providerId,
        'coverLetter': coverLetter,
        'submittedAt': submittedAt.toIso8601String(),
        'status': status,
      };
}
