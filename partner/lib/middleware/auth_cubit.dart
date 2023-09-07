import 'dart:convert';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';

import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthInitial> {
  AuthCubit() : super(AuthInitial(otpSent: false, loading: false));
  String pathGetOtp = "/user/login/";

  void getOTP(String phoneNumber) async {
    Map<String, dynamic> parameters = {"phone": phoneNumber};
    emit(AuthInitial(otpSent: false, loading: true));
    await getData(
            path: pathGetOtp,
            urlParameters: parameters,
            queryType: QueryType.get)
        .whenComplete(
      () {
        emit(
          AuthInitial(
            otpSent: true,
            loading: false,
            obj: Token(phoneNumber: phoneNumber),
          ),
        );
      },
    );
  }

  void loginWithOtp(String otp) async {
    emit(AuthInitial(otpSent: false, loading: true, obj: state.obj));
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> body = {
      'otp': otp,
      'username': '',
      'room': '',
      'phone': state.obj!.phoneNumber,
    };
    print(state.obj!.phoneNumber);
    print(otp);
    try {
      Response response = await getData(
          path: pathGetOtp,
          queryType: QueryType.post,
          body: body,
          headers: headers);
      Map<String, dynamic> responseBody = json.decode(response.body);
      print(responseBody);
      if (responseBody['access'] != null) {
        emit(
          AuthInitial(
            otpSent: false,
            loading: false,
            obj: Token(
                phoneNumber: state.obj!.phoneNumber,
                authToken: responseBody['access'],
                refreshToken: responseBody['refresh']),
          ),
        );
      }
    } catch (e) {
      emit(AuthInitial(
          otpSent: false,
          loading: false,
          messaage: e.toString(),
          obj: state.obj));
    }
  }
}
