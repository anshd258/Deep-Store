part of 'auth_cubit.dart';

class AuthInitial {
  Authrepository? obj;
  bool? loading = false;
  bool? autoLogin;
  String? jwt;
  UserModal? userObj;
  String? messaage;
  bool otpSent = false;
  AuthInitial(
      {this.obj,
      required this.otpSent,
      this.loading,
      this.messaage,
      this.jwt,
      this.autoLogin,
      this.userObj});
}
