
import 'package:services_application/data/data_sources/remote/user_info_remote_data_source.dart';
import 'package:services_application/data/repositories/user_info_repo.dart';

class UserInfoRepoImpl implements UserInfoRepo{
UserInfoRemoteDataSource userInfoRemoteDataSource;
UserInfoRepoImpl({required this.userInfoRemoteDataSource});

  @override
  Future<Map<String,dynamic>> getUserInfo(String userId) {
  return userInfoRemoteDataSource.getUserInfo(userId);
  }
}