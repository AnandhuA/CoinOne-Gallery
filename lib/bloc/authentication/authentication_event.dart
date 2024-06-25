part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class SignUpButtonClickEvent extends AuthenticationEvent {
  final String email;
  final String passsword;

  SignUpButtonClickEvent({required this.email, required this.passsword});
}

final class LoginButtonClickEvent extends AuthenticationEvent {
   final String email;
  final String passsword;

  LoginButtonClickEvent({required this.email, required this.passsword});
}
