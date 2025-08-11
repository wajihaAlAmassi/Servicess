import 'package:servicess/data/data_sources/invetation_remote_data_source.dart';
import 'package:servicess/data/repositories/invetation_repo.dart';

class InvetationRepoImpl implements InvetationRepo {
  InvetationRemoteDataSource invetationRemoteDataSource;
  InvetationRepoImpl({required this.invetationRemoteDataSource});
  @override
  Future<Map<String, dynamic>> getInvetations(String userId) {
    return invetationRemoteDataSource.getInvitations(userId);
  }

  @override
  Future<void> acceptInvetaion(String invId) {
    return invetationRemoteDataSource.acceptInvitation(invId);
  }

  @override
  Future<void> rejectInvetaion(String invId) {
    return invetationRemoteDataSource.rejectInvitation(invId);
  }
}
