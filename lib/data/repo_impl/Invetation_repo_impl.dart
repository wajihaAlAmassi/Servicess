

import 'package:services_application/data/data_sources/invetation_remote_data_source.dart';
import 'package:services_application/data/repositories/invetation_repo.dart';

class InvetationRepoImpl implements InvetationRepo {
  InvetationRemoteDataSource invetationRemoteDataSource;
  InvetationRepoImpl({required this.invetationRemoteDataSource});
  @override
  Future<Map<String, dynamic>> getInvetations(String userId) {
    return invetationRemoteDataSource.getInvetations(userId);
  }

  @override
  Future<void> acceptInvetaion(String invId) {
    return invetationRemoteDataSource.acceptInvetation(invId);
  }

  @override
  Future<void> rejectInvetaion(String invId) {
    return invetationRemoteDataSource.rejectInvetation(invId);
  }
}
