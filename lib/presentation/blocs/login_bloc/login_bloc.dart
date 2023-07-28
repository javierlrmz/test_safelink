
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../infrastructure/inputs/inputs.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEmailChanged>(_onEmailChange);
    on<LoginPasswordChanged>(_onPasswordChange);
    on<LoginFormSubmitted>(_onFormSubmit);
    on<LoginObscuredText>(_changeObscureText);
  }

  void _onEmailChange(LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        email: Email.dirty(event.email),
        isValid: Formz.validate([state.password, state.email])));
  }

  void _onPasswordChange(LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        password: Password.dirty(event.password),
        isValid: Formz.validate([state.email, state.password])));
  }

  void _onFormSubmit(LoginFormSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        isFormPosted: true,
        email: Email.dirty(state.email.value),
        password: Password.dirty(state.password.value),
        isValid: Formz.validate([
          state.email,
          state.password,
        ])));
    if (!state.isValid) return;

    await _saveToken();

    event.context.go('/home');
  }

  void _changeObscureText(LoginObscuredText event, Emitter<LoginState> emit){
    emit(state.copyWith(
      isObscure: !state.isObscure
    ));
  }

  void showText(){
    add(LoginObscuredText());
  }

  _saveToken() async {
    final token = '${DateTime.now().millisecondsSinceEpoch}';
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

}
