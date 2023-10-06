part of 'auth_cubit.dart';

class AuthState {
  Authentication? obj;
  User? user;
  bool? loading = false;
  bool? otpSent = false;
  AuthState({
    this.obj,
     this.otpSent,
    this.loading,
    this.user,
  });
}


