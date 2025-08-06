class InvetationRemoteDataSource {
  Future<Map<String, dynamic>> getInvetations(String userId) async {
    //? do your magic (call the job data and the requester who sent it )
    return {
      'requesterId': 'default requester',
      'jopName': 'Flutter dev',
      'job descreption':
          'i need you to make an app that have 123.....',
      'jobReq': [
        '+2 years of expereince',
        'made at least 5 projects',
        'fluent in english',
        'ability to work with team',
        'ability to work under pressure',
        'handle bugs and problems',
      ],
      'ReqSkills': ['leader', 'probelm solver', 'skill3', 'skill4'],
      'salary': 'Money\$',
      'applicationDeadline': 'Day/Month/Year',
      'jobStatus':
          'pending', // if he accept then change to accept , same if reject , and if deadline came , then put 'expiered'
    };
  }
  Future<void> acceptInvetation(String invId)async{
    //? accept the invetation
  }
  Future<void> rejectInvetation(String invId)async{
    //? reject the invetation
  }
}
