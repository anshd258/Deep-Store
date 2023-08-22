part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {
  final User? user;

  const AuthenticationState(this.user);
}

final class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial(super.user);
}
final class UpdateAuthenticationState extends AuthenticationState {
  const UpdateAuthenticationState(super.user);
}
