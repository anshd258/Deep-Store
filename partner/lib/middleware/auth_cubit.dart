import 'package:bloc/bloc.dart';

import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/middleware/Repository/AuthRepo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthInitial> {
  final Authrepository _authrepository;
  AuthCubit(this._authrepository)
      : super(AuthInitial(otpSent: false, loading: false));

  String pathGetOtp = "/user/login/";

  void getOTP(String phoneNumber) async {
    Map<String, dynamic> parameters = {"phone": phoneNumber};
    emit(AuthInitial(otpSent: false, loading: true));
    await getData(
            path: pathGetOtp,
            urlParameters: parameters,
            queryType: QueryType.get)
        .then(
      (value) {
        String token = value['jwt'];
        emit(
          AuthInitial(
            jwt: token,
            otpSent: true,
            loading: false,
            obj: Token(
              phoneNumber: phoneNumber,
            ),
          ),
        );
      },
    );
  }

  void loginWithOtp(String otp) async {
    emit(AuthInitial(
        otpSent: false, loading: true, obj: state.obj, jwt: state.jwt));
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'jwt': state.jwt!
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
      // if (otp == "123456") {
      //   Timer(Duration(seconds: 1), () {
      //     emit(AuthInitial(
      //         otpSent: false,
      //         loading: false,
      //         obj: Token(
      //             phoneNumber: state.obj!.phoneNumber,
      //             authToken: "afsasfsaf",
      //             refreshToken: "asdsad")));
      //   });
      // } else {
      //   await Future.delayed(const Duration(seconds: 1), () {
      //     throw (Exception("invalid otp"));
      //   });
      // }
      Map<String, dynamic> response = await getData(
          path: pathGetOtp,
          queryType: QueryType.post,
          body: body,
          headers: headers);

      print(response);
      if (response['access'] != null) {
        _authrepository.update(response['access'], response['refresh']);
        emit(
          AuthInitial(
            otpSent: false,
            loading: false,
            obj: Token(
                phoneNumber: state.obj!.phoneNumber,
                authToken: response['access'],
                refreshToken: response['refresh']),
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
