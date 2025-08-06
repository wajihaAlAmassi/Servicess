

import 'package:services_application/data/data_sources/invetation_remote_data_source.dart';
import 'package:services_application/data/data_sources/remote/user_info_remote_data_source.dart';
import 'package:services_application/data/repo_impl/Invetation_repo_impl.dart';
import 'package:services_application/data/repo_impl/user_info_repo_impl.dart';
import 'package:services_application/data/repositories/invetation_repo.dart';
import 'package:services_application/data/repositories/user_info_repo.dart';
import 'package:services_application/domain/usecases/accept_invetation_usecase.dart';
import 'package:services_application/domain/usecases/get_provider_invetations_usecase.dart';
import 'package:services_application/domain/usecases/get_user_info_usecase.dart';
import 'package:services_application/domain/usecases/reject_invetation_usecase.dart';
import 'package:services_application/presentation/bloc/invetation/invetation_bloc.dart';
import 'package:services_application/presentation/bloc/user_info/user_info_bloc.dart';

GetIt sl = GetIt.instance;
Future<void> initialaizedDependencies() async {
  sl.registerSingleton<UserInfoRemoteDataSource>(
    UserInfoRemoteDataSource(),
  );
  sl.registerSingleton<InvetationRemoteDataSource>(
    InvetationRemoteDataSource(),
  );
  // ************************************************************
  sl.registerSingleton<UserInfoRepo>(
    UserInfoRepoImpl(
      userInfoRemoteDataSource: sl<UserInfoRemoteDataSource>(),
    ),
  );
  sl.registerSingleton<InvetationRepo>(
    InvetationRepoImpl(
      invetationRemoteDataSource: sl<InvetationRemoteDataSource>(),
    ),
  );
  // **********************************************************************

  sl.registerSingleton<GetUserInfoUsecase>(
    GetUserInfoUsecase(userInfoRepo: sl<UserInfoRepo>()),
  );
  sl.registerSingleton<GetProviderInvetationsUsecase>(
    GetProviderInvetationsUsecase(repo: sl<InvetationRepo>()),
  );
  sl.registerSingleton<AcceptInvetationUsecase>(
    AcceptInvetationUsecase(repo: sl<InvetationRepo>()),
  );
  sl.registerSingleton<RejectInvetationUsecase>(
    RejectInvetationUsecase(repo: sl<InvetationRepo>()),
  );
  // ******************************************************
  sl.registerFactory<UserInfoBloc>(
    () => UserInfoBloc(getUserInfoUsecase: sl<GetUserInfoUsecase>()),
  );
  sl.registerFactory<InvetationBloc>(
    () => InvetationBloc(
      getProviderInvetationsUsecase:
          sl<GetProviderInvetationsUsecase>(),
      acceptInvetationUsecase: sl<AcceptInvetationUsecase>(),
      rejectInvetationUsecase: sl<RejectInvetationUsecase>(),
    ),
  );
}
