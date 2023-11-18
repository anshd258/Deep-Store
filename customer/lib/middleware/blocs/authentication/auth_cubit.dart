import 'dart:async';
import 'package:customer/data/apiservice.dart';
import 'package:customer/data/models/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../constants/apiendpoints.dart';
import '../../../constants/localstorage.keys.dart';
import '../../../data/models/user.dart';
import '../../helpers/storage.utils.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(otpSent: false, loading: false));

  /// Authentication bloc
  /// following are the methods:
  ///   [getUserDetails]
  ///   [updateUserDetails]
  ///   [getOTP]
  ///   [loginWithOtp]
  ///   [clear]

  void clear() {
    emit(AuthState(otpSent: false, loading: false));
  }

  Future<bool> getUserDetails() async {
    String? phone =
        await LocalStorage.read(key: LocalStorageKeys.userPhoneNumber);
    if (phone != null) {
      Map<String, dynamic>? apiResponse = await ApiService.get(
          endpoint: ApiEndpoints.getUserDetails,
          urlParameters: {'phone': phone});
      var userData = User.fromJson(apiResponse!['userdata']);
      User? user = userData;
      emit(AuthState(
          loading: state.loading,
          obj: state.obj,
          otpSent: state.otpSent,
          user: user));
      return true;
    }
    return false;
  }

  Future<bool> updateUserDetails(
      {required String roomNumber,
      required String providerid,
      String? name,
      String? email,
      String? phone}) async {
    name ??= await LocalStorage.read(key: LocalStorageKeys.name) ?? '';
    email ??= await LocalStorage.read(key: LocalStorageKeys.email) ?? '';
    phone ??=
        await LocalStorage.read(key: LocalStorageKeys.userPhoneNumber) ?? '';
    try {
      Map<String, dynamic>? response = await ApiService.post(
          endpoint: ApiEndpoints.updateUserDetails,
          body: {
            'room': roomNumber,
            'username': name,
            'property_id': providerid,
            'email': email
          });

      if (response != null) {
        if (response['status'] == 'success') {
          return true;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('unable to update user details $e');
      }
    }
    return false;
  }

  void getOTP(String phoneNumber) async {
    await LocalStorage.write(
        key: LocalStorageKeys.userPhoneNumber, value: phoneNumber.toString());
    Map<String, dynamic> parameters = {"phone": phoneNumber};
    emit(AuthState(otpSent: false, loading: true));

    try {
      Map<String, dynamic>? response = await ApiService.get(endpoint: ApiEndpoints.getOtp,urlParameters: parameters, headers: {})
              
          .then((value) {
        return value;
      });

        String jwtToken = response!['jwt'];
        emit(
          AuthState(
            otpSent: true,
            loading: false,
            obj: Authentication(phoneNumber: phoneNumber, authToken: jwtToken),
          ),
        );
    } catch (e) {
      if (kDebugMode) {
        print('unable to request for otp $e');
      }
      emit(AuthState(otpSent: false, loading: false));
    }
  }

  void loginWithOtp(String otp) async {
    emit(AuthState(otpSent: false, loading: true, obj: state.obj));

    Map<String, dynamic> body = {'phone': state.obj!.phoneNumber, 'otp': otp};
    print(body);
    print(state.obj!.authToken.toString());
    try {
      Map<String, dynamic>? credentials = await ApiService.post(
          endpoint: ApiEndpoints.getOtp,
          body: body,
          headers: {'jwt': state.obj!.authToken.toString()});

      print(credentials);
      if (credentials!['access'] != null) {
        emit(
          AuthState(
            otpSent: false,
            loading: false,
            obj: Authentication(
                phoneNumber: state.obj!.phoneNumber,
                accessToken: credentials['access'],
                newUser: credentials['new_user'],
                refreshToken: credentials['refresh']),
          ),
        );

        LocalStorage.write(
            key: LocalStorageKeys.accessToken,
            value: credentials['access'] ?? '');
        LocalStorage.write(
            key: LocalStorageKeys.refreshToken,
            value: credentials['access'] ?? '');
        LocalStorage.write(
            key: LocalStorageKeys.userPhoneNumber,
            value: state.obj!.phoneNumber ?? '');
      }
      if (credentials['status'] == 'Login failed') {
        emit(AuthState(otpSent: false, loading: false, obj: state.obj));
      }
    } catch (e) {
      print('unable to login with OTP: $e');
      emit(AuthState(otpSent: false, loading: false, obj: state.obj));
    }
  }
}
