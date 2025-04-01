part of 'login_auth_bloc.dart';

@immutable
sealed class LoginAuthEvent {}

class LoginDetailsSubmitted extends LoginAuthEvent {
  final String loginid;
  final String password;
  LoginDetailsSubmitted({required this.loginid, required this.password});
}
