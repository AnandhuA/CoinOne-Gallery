import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<LoginButtonClickEvent>(_loginButtonClickEvent);
    on<SignUpButtonClickEvent>(_signUpButtonClickEvent);
  }

  FutureOr<void> _loginButtonClickEvent(
    LoginButtonClickEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(AuthenticationLoadingState());
  }

  FutureOr<void> _signUpButtonClickEvent(
      SignUpButtonClickEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationLoadingState());
  }
}
