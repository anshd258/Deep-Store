part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {
  final User? user;
  const AuthenticationState(this.user);
}

final class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial(super.user);
}




final class LoginEvent extends AuthenticationState {
  const LoginEvent(super.user);
}

final class LogoutEvent extends AuthenticationState {
  const LogoutEvent(super.user);
}
