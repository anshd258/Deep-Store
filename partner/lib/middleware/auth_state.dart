part of 'auth_cubit.dart';

class AuthInitial {
  Token? obj;
  bool? loading = false;
  String? jwt;
  String? messaage;
  bool otpSent = false;
  AuthInitial({this.obj, required this.otpSent, this.loading, this.messaage, this.jwt});
}

class Token {
  String? authToken;
  String phoneNumber;
  String? refreshToken;
  Token({this.authToken, this.refreshToken, required this.phoneNumber});
  void setTokenLocally() {}
  void removeTokenLocally() {}
}
