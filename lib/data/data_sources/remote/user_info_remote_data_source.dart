class UserInfoRemoteDataSource {
  Future<Map<String, dynamic>> getUserInfo(String userId) async {
    //? put the code that call the data from backend (API)
    //? it will be better to call the user types (requester or provider , Solo or Company)
    //? and then send it under , or better make if statment
    // ex: if it was requester and Solo , use   RequesterSoloModel.fromMap() , and here send it as RequesterSoloModel
    // or better for now  just use Map
    /* */
    return {
      'userType': 'Provider',
      'selectedServiceType': 'Solo',
      'id': userId,
      'fullName': "User Name",
      'age': "23",
      'gender': 'Female',
      'email': 'account@gmail.com',
      'phoneNumber': '0599998887',
      'city': 'Gaza',
      'zipCode': '123456',
      'jobTitle': 'user Jop',
      'experienceYears': '2',
      'educationLevel': 'Bachlor\'s',
      'preferredWorkNature': 'Part-Time',
      'skills': {'Skill1': 'java', 'Skill2': 'C++'},
      'password': '1223456789',

    };
  }
}
