part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class UpdateAuthenticationEvent extends AuthenticationEvent {
  final User? user;

  UpdateAuthenticationEvent({this.user});
}

class GetAuthStatus extends AuthenticationEvent {}
