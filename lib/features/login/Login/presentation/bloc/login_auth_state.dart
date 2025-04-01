part of 'login_auth_bloc.dart';

@immutable
sealed class LoginAuthState {}

final class LoginAuthInitial extends LoginAuthState {}

final class LoginLoading extends LoginAuthState {}

final class LoginSucess extends LoginAuthState {}

final class LoginFailure extends LoginAuthState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}
