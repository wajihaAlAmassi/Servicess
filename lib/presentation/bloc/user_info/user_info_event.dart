part of 'user_info_bloc.dart';

abstract class UserInfoEvent {
  const UserInfoEvent(); 
}
class GetUserInfoEvent extends UserInfoEvent{
  String userId;
  GetUserInfoEvent({required this.userId});
}