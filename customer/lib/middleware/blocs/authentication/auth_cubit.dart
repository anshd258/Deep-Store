import 'dart:async';
import 'dart:convert';

import 'package:customer/data/models/apiresponse.dart';
import 'package:customer/data/models/authentication.dart';
import 'package:customer/data/datasource.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../../data/models/user.dart';
import '../../helpers/constants.dart';
import '../../helpers/sharedprefrence.utils.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(otpSent: false, loading: false));

  void clear() {
    emit(AuthState(otpSent: false, loading: false));
  }

  Future<bool> getUserDetails() async {
    String? phone = await SharedPreferencesUtils.getString(
        key: SharedPrefrencesKeys.userPhoneNumber);
    if (phone != null) {
      ApiResponse? apiResponse = await DataSource.getData(
          path: DataSource.getUserDetails, urlParameters: {'phone': phone});
      if (apiResponse!.userData != null) {
        User? user = apiResponse.userData;
        emit(AuthState(
            loading: state.loading,
            obj: state.obj,
            otpSent: state.otpSent,
            user: user));
        return true;
      }
    }
    return false;
  }

  Future<bool> updateUserDetails(
      {required String roomNumber,
      required String providerid,
      String? name,
      String? email,
      String? phone}) async {
    name ??= await SharedPreferencesUtils.getString(
            key: SharedPrefrencesKeys.name) ??
        '';
    email ??= await SharedPreferencesUtils.getString(
            key: SharedPrefrencesKeys.email) ??
        '';
    phone ??= await SharedPreferencesUtils.getString(
            key: SharedPrefrencesKeys.userPhoneNumber) ??
        '';
    try {
      Response? response = await DataSource.get(
          path: DataSource.updateUserDetails,
          queryType: QueryType.post,
          body: {
            'room': roomNumber,
            'username': name,
            'property_id': providerid,
            'email': email
          });

      if (response != null) {
        if (json.decode(response.body)['status'] == 'success') {
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
    await SharedPreferencesUtils.storeString(
        key: SharedPrefrencesKeys.userPhoneNumber,
        value: phoneNumber.toString());
    Map<String, dynamic> parameters = {"phone": phoneNumber};
    emit(AuthState(otpSent: false, loading: true));

    try {
      Response response = await get(
              Uri.https(DataSource.backend, DataSource.getOtp, parameters))
          .then((value) {
        return value;
      });

      if (response.statusCode == 200) {
        String jwtToken = json.decode(response.body)['jwt'];
        emit(
          AuthState(
            otpSent: true,
            loading: false,
            obj: Authentication(phoneNumber: phoneNumber, authToken: jwtToken),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('unable to request for otp $e');
      }
      emit(AuthState(otpSent: false, loading: false));
    }
  }

  void loginWithOtp(String otp) async {
    emit(AuthState(otpSent: false, loading: true, obj: state.obj));

    Map<String, dynamic> body = {
      'otp': otp,
      'phone': state.obj!.phoneNumber,
    };
    try {
      Response? response = await DataSource.get(
          queryType: QueryType.post,
          path: DataSource.getOtp,
          body: body,
          headers: {'jwt': state.obj!.authToken.toString()});
      Map<String, dynamic> credentials = json.decode(response!.body);
      // ApiResponse? response = await DataSource.getData(
      //     queryType: QueryType.post,
      //     path: DataSource.getOtp,
      //     body: body,
      //     headers: {'jwt': state.obj!.authToken.toString()});
      if (credentials['access'] != null) {
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

        SharedPreferencesUtils.storeString(
            key: SharedPrefrencesKeys.accessToken,
            value: credentials['access'] ?? '');
        SharedPreferencesUtils.storeString(
            key: SharedPrefrencesKeys.refreshToken,
            value: credentials['access'] ?? '');
        SharedPreferencesUtils.storeString(
            key: SharedPrefrencesKeys.userPhoneNumber,
            value: state.obj!.phoneNumber ?? '');
      }
    } catch (e) {
      emit(AuthState(otpSent: false, loading: false, obj: state.obj));
    }
  }
}
