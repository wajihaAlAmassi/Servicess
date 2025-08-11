import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:servicess/data/data_sources/invetation_remote_data_source.dart';
import 'package:servicess/data/data_sources/remote/user_info_remote_data_source.dart';
import 'package:servicess/data/repo_impl/Invetation_repo_impl.dart';
import 'package:servicess/data/repo_impl/user_profile_repo_impl.dart';
import 'package:servicess/data/repositories/invetation_repo.dart';
import 'package:servicess/data/repositories/user_profile_repo.dart';
import 'package:servicess/domain/usecases/accept_invetation_usecase.dart';
import 'package:servicess/domain/usecases/get_provider_invetations_usecase.dart';
import 'package:servicess/domain/usecases/get_user_profile_info_usecase.dart';
import 'package:servicess/domain/usecases/reject_invetation_usecase.dart';
import 'package:servicess/presentation/bloc/invetation/invetation_bloc.dart';
import 'package:servicess/presentation/bloc/user_profile/user_profile_bloc.dart';

GetIt sl = GetIt.instance;
Future<void> initialaizedDependencies() async {
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerSingleton<UserInfoRemoteDataSource>(
    UserInfoRemoteDataSource(),
  );
  sl.registerSingleton<InvetationRemoteDataSource>(
    InvetationRemoteDataSource(dio: sl<Dio>()),
  );
  // ************************************************************
  sl.registerSingleton<UserProfileRepo>(
    UserProfileRepoImpl(
      userInfoRemoteDataSource: sl<UserInfoRemoteDataSource>(),
    ),
  );
  sl.registerSingleton<InvetationRepo>(
    InvetationRepoImpl(
      invetationRemoteDataSource: sl<InvetationRemoteDataSource>(),
    ),
  );
  // **********************************************************************

  sl.registerSingleton<GetUserProfileInfoUsecase>(
    GetUserProfileInfoUsecase(userInfoRepo: sl<UserProfileRepo>()),
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
  sl.registerFactory<UserProfileBloc>(
    () => UserProfileBloc(
      getUserInfoUsecase: sl<GetUserProfileInfoUsecase>(),
    ),
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
