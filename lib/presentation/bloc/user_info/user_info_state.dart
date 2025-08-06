part of 'user_info_bloc.dart';

abstract class UserInfoState {
  const UserInfoState();
  
}

 class UserInfoInitial extends UserInfoState {}

 class UserInfoLoadingState extends UserInfoState {}

 class GotUserInfoState extends UserInfoState {
  Map<String,dynamic> userInfo;
  
  GotUserInfoState({required this.userInfo});
 }
class UserInfoExceptionState extends UserInfoState{
  String message;
  UserInfoExceptionState({required this.message});
}