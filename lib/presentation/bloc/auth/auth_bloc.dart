import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services_application/data/repositories/auth_repository.dart';
import 'package:services_application/presentation/bloc/auth/auth_event.dart';
import 'package:services_application/presentation/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  String? _token;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginButtonPressed>(_onLogin);
    on<LogoutPressed>(_onLogout);
    on<RegisterPressed>(_onRegister);
    on<VerifyCodePressed>(_onVerify);
  }

  Future<void> _onLogin(LoginButtonPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final token = await authRepository.login(event.email, event.password);
      _token = token;
      emit(AuthSuccess(token));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogout(LogoutPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepository.logout(_token!);
      emit(LogoutSuccess());
    } catch (e) {
      emit(AuthFailure("Log out failed"));
    }
  }


Future<void> _onRegister(RegisterPressed event, Emitter<AuthState> emit) async {
  emit(AuthLoading());

  try {
    final userType = event.data['userType'];

    if (userType == 'Company') {
      await authRepository.registerWithCompanyData(event.data);
    } else if (userType == 'Solo') {
      await authRepository.registerWithUserData(event.data);
    } else {
      throw Exception('Unkown type of user');
    }

    emit(AuthSuccess("Sing up success"));
  } catch (e) {
    emit(AuthFailure("Sign up failed: ${e.toString()}"));
  }
  
}




Future<void> _onVerify(VerifyCodePressed event, Emitter<AuthState> emit) async {
  emit(AuthLoading());
  try {
    final valid = await authRepository.verifyCode(event.email, event.code);
    if (valid) {
      emit(VerificationSuccess());
    } else {
      emit(AuthFailure("Invalied Verification code "));
    }
  } catch (e) {
    emit(AuthFailure(e.toString()));
  }
}





}
