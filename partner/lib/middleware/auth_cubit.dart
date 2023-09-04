import 'dart:convert';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';

import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthInitial> {
  AuthCubit() : super(AuthInitial(otpSent: false));
  String pathGetOtp = "/user/login/";

  void getOTP(String phoneNumber) async {
    Map<String, dynamic> parameters = {"phone": phoneNumber};
    await getData(
            path: pathGetOtp,
            urlParameters: parameters,
            queryType: QueryType.get)
        .whenComplete(
      () {
        emit(
          AuthInitial(
            otpSent: true,
            obj: Token(phoneNumber: phoneNumber),
          ),
        );
      },
    );
  }

  void loginWithOtp(String otp) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {
      'otp': otp,
      'username': '',
      'phone': state.obj!.phoneNumber,
    };
    print(state.obj!.phoneNumber);
    print(otp);
    Response? response = await getData(
        path: pathGetOtp,
        queryType: QueryType.post,
        body: body,
        headers: headers);
    Map<String, dynamic> responseBody =
        response == null ? {} : json.decode(response.body);
    if (responseBody['access'] != null) {
      emit(
        AuthInitial(
          otpSent: false,
          obj: Token(
              phoneNumber: state.obj!.phoneNumber,
              authToken: responseBody['access'],
              refreshToken: responseBody['refresh']),
        ),
      );
    }
  }
}
