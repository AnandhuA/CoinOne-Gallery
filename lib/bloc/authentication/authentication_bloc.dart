import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coinone_gallery/auth/authentication_functions.dart';
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
  ) async {
    emit(AuthenticationLoadingState());
    String responce = await AuthenticationRepo.logIn(
      email: event.email,
      password: event.passsword,
    );
    if (responce == "Success") {
      emit(AuthenticationSuccessState());
    } else {
      emit(AuthenticationErrorState(error: responce));
    }
  }

  FutureOr<void> _signUpButtonClickEvent(
    SignUpButtonClickEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoadingState());
    String responce = await AuthenticationRepo.signUp(
        email: event.email, password: event.passsword);
    if (responce == "Success") {
      emit(AuthenticationSuccessState());
    } else {
      emit(AuthenticationErrorState(error: responce));
    }
  }
}
