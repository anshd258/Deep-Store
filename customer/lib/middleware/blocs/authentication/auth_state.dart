part of 'auth_cubit.dart';

class AuthInitial {
  Authentication? obj;
  bool? loading = false;
  bool otpSent = false;
  AuthInitial({this.obj, required this.otpSent, this.loading, });
}

