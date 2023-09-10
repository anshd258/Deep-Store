import 'dart:convert';
import 'package:customer/data/models/apiresponse.dart';
import 'package:customer/data/repositories/datasource.dart';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';

import '../../helpers/constants.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthInitial> {
  AuthCubit() : super(AuthInitial(otpSent: false, loading: false));
  

  void getOTP(String phoneNumber) async {
    Map<String, dynamic> parameters = {"phone": phoneNumber};
    emit(AuthInitial(otpSent: false, loading: true));
    await DataSource.getData(
            path: DataSource.getOtp,
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
    try {
      ApiResponse? response = await DataSource.getData(
          path: DataSource.getOtp,
          queryType: QueryType.post,
          body: body,
          headers: headers);
      if (response!.access != null) {
        emit(
          AuthInitial(
            otpSent: false,
            loading: false,
            obj: Token(
                phoneNumber: state.obj!.phoneNumber,
                authToken: response!.access,
                refreshToken: response.refresh),
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