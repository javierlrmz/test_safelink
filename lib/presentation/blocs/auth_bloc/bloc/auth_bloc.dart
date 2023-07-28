import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<GetAuthToken>(_getToken);
    on<DeleteAuthToken>(_deleteToken);
  }

  void _getToken(GetAuthToken event, Emitter<AuthState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    emit(state.copyWith(token: prefs.getString('token')));
  }

  _deleteToken(DeleteAuthToken event, Emitter<AuthState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    emit(state.copyWith(token: prefs.getString('token')));
    // event.context.go('/');
  }
}
