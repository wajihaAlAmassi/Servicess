
import 'package:services_application/data/repositories/user_info_repo.dart';

class GetUserInfoUsecase {
UserInfoRepo userInfoRepo;
GetUserInfoUsecase({required this.userInfoRepo});
Future<Map<String,dynamic>> call(String userId){
 return userInfoRepo.getUserInfo(userId);
}
}