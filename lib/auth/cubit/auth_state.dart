part of 'auth_cubit.dart';


abstract class AuthState {}

class AuthInitial extends AuthState {}

// login
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}


class LoginErrorState extends AuthState {
  final String errMsg;

  LoginErrorState({required this.errMsg});
}

class LoginCustomException extends AuthState {
  final String errMsg;

  LoginCustomException({required this.errMsg});
}


//register

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String errMsg;

  RegisterErrorState({required this.errMsg});
}

class RegisterCustomException extends AuthState {
  final String errMsg;

  RegisterCustomException({required this.errMsg});
}


//logout

class LogoutSuccessState  extends AuthState {} 

class LogoutErrorState extends AuthState{
  final String errMsg;

  LogoutErrorState({required this.errMsg});
}

class LogoutLoadingState extends AuthState{}
