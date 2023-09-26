import 'dart:convert';

import 'package:customer/data/models/apiresponse.dart';
import 'package:customer/data/models/authentication.model.dart';
import 'package:customer/data/repositories/datasource.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import '../../helpers/constants.dart';
import '../../helpers/shared_preferences_utils.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthInitial> {
  AuthCubit() : super(AuthInitial(otpSent: false, loading: false)) {}

  Future<bool> updateRoomNumber(String roomNumber) async {
    http.Response? response = await DataSource.get(
        path: DataSource.updateRoomNumber,
        queryType: QueryType.post,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${state.obj!.accessToken}'
        },
        body: {
          'room': roomNumber
        });

    if (response != null) {
      if (response.statusCode == 200) {
        return true;
      }
    }
    return false;
  }

  void getOTP(String phoneNumber) async {
    await SharedPreferencesUtils.storeString(
        key: SharedPrefrencesKeys.userPhoneNumber,
        value: phoneNumber.toString());
    Map<String, dynamic> parameters = {"phone": phoneNumber};
    emit(AuthInitial(otpSent: false, loading: true));

    try {
      http.Response response = await http
          .get(Uri.https(DataSource.backend, DataSource.getOtp, parameters));
      if (response.statusCode == 200) {
        String jwtToken = json.decode(response.body)['jwt'];
        emit(
          AuthInitial(
            otpSent: true,
            loading: false,
            obj: Authentication(phoneNumber: phoneNumber, authToken: jwtToken),
          ),
        );
      }
    } catch (e) {
      print('unable to request for otp');
      emit(AuthInitial(otpSent: false, loading: false));
    }
  }

  void loginWithOtp(String otp) async {
    emit(AuthInitial(otpSent: false, loading: true, obj: state.obj));

    Map<String, dynamic> body = {
      'otp': otp,
      'phone': state.obj!.phoneNumber,
    };
    try {
      http.Response? response = await DataSource.get(
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
          AuthInitial(
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
      emit(AuthInitial(otpSent: false, loading: false, obj: state.obj));
    }
  }
}
