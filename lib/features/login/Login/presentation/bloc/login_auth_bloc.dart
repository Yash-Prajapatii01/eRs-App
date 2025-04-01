import 'package:bloc/bloc.dart';
import 'package:ers_app/features/login/Login/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';

part 'login_auth_event.dart';
part 'login_auth_state.dart';

class LoginAuthBloc extends Bloc<LoginAuthEvent, LoginAuthState> {
  final LoginUsecase loginUsecase;
  LoginAuthBloc(this.loginUsecase
      )
      : super(LoginAuthInitial()) {
    on<LoginDetailsSubmitted>(_onLoginDetailsSubmitted);
  }

  Future<void> _onLoginDetailsSubmitted(
      LoginDetailsSubmitted event, Emitter<LoginAuthState> emit) async {
    emit(LoginLoading());
    try {
      final bool isLoginSuccess = await loginUsecase.login(event.loginid, event.password);
      if (isLoginSuccess) {
        emit(LoginSucess());
      } else {
        emit(LoginFailure(errorMessage: 'Invalid login details'));
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: 'Something went wrong'));
    }
  }
}
