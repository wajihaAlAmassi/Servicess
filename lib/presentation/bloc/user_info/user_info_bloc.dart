import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:services_application/domain/usecases/get_user_info_usecase.dart';


part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  GetUserInfoUsecase getUserInfoUsecase;
  UserInfoBloc({required this.getUserInfoUsecase}) : super(UserInfoInitial()) {
    on<GetUserInfoEvent>(_onGetUserInfo);
  }

  FutureOr<void> _onGetUserInfo(GetUserInfoEvent event, Emitter<UserInfoState> emit) async{
try {
emit(UserInfoLoadingState());
      final result = await getUserInfoUsecase.call(event.userId);
emit(GotUserInfoState( userInfo: result));
} catch (e) {
  emit(UserInfoExceptionState(message: "unable to get Info : ${e.toString()}"));
}    
  }
}
