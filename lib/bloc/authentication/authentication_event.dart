part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class SignUpButtonClickEvent extends AuthenticationEvent{}

final class LoginButtonClickEvent extends AuthenticationEvent{}