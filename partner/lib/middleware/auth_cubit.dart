import 'package:bloc/bloc.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/user.dart';
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
        print('otp sent');
        String token = value['jwt'];
        _authrepository.update(phone: phoneNumber);
        emit(
          AuthInitial(
              jwt: token, otpSent: true, loading: false, obj: _authrepository),
        );
      },
    );
  }

  void loginWithOtp(String otp) async {
    emit(AuthInitial(
        otpSent: false, loading: true, jwt: state.jwt, obj: state.obj));
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'jwt': state.jwt!
    };

    Map<String, dynamic> body = {
      'otp': otp,
      'username': '',
      'room': '',
      'phone': _authrepository.phoneNumber,
    };

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
        _authrepository.setLocally(
            response['access'], response['refresh'], state.obj!.phoneNumber);
        _authrepository.update(
            access: response['access'],
            refresh: response['refresh'],
            phone: state.obj!.phoneNumber);
        emit(
          AuthInitial(
              otpSent: false, loading: false, obj: state.obj, jwt: state.jwt),
        );
      }
    } catch (e) {
      emit(AuthInitial(
        otpSent: false,
        loading: false,
        obj: state.obj,
        jwt: state.jwt,
        messaage: e.toString(),
      ));
    }
  }

  void autoLogin() async {
    var data = await _authrepository.getData();
    if (data.first == "no data") {
      emit(AuthInitial(otpSent: false, loading: true, autoLogin: false));
    } else {
      _authrepository.update(
          access: data.elementAt(1),
          refresh: data.elementAt(2),
          phone: data.elementAt(3));
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${_authrepository.accessToken}',
      };

      try {
        Map<String, dynamic> response = await getData(
            headers: headers,
            path: "/user/get-user",
            urlParameters: {'phone': _authrepository.phoneNumber});
        if (response.toString() != "Exception: token_not_valid") {
          emit(
            AuthInitial(
              otpSent: false,
              loading: false,
              autoLogin: true,
            ),
          );
        }
      } catch (e) {
        emit(AuthInitial(
          otpSent: false,
          loading: false,
          messaage: e.toString(),
          autoLogin: false,
        ));
      }
    }
  }

  Future<void> logout() async {
    await _authrepository.delete();
    emit(AuthInitial(otpSent: false));
  }

  Future<bool> updateUserDetails(
      {required String roomNumber,
      required String providerid,
      String? name,
      String? email,
      String? phone}) async {
    name ??= state.userObj!.userdata!.username ?? '';
    email ??= state.userObj!.userdata!.user!.email ?? '';
    phone ??= state.userObj!.userdata!.contact ?? '';
    print('got name and email : $name , $email');
    print({
      'room': roomNumber,
      'username': name,
      'property_id': providerid,
      'email': email
    });
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    try {
      Map<String, dynamic> response = await await getData(
          path: "/user/update-user/",
          headers: headers,
          body: {
            'room': roomNumber,
            'username': name,
            'property_id': providerid,
            'email': email
          },
          queryType: QueryType.post);

      print('we got a response ${response}');
      if (response['status'] == 'success') {
        getUserDetails();
        return true;
      }
    } catch (e) {
      print('unable to update user details $e');
    }
    return false;
  }

  Future<bool> getUserDetails() async {
    String? phone = _authrepository.phoneNumber;
    emit(
      AuthInitial(
        otpSent: false,
        loading: true,
      ),
    );
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    try {
      Map<String, dynamic> response = await getData(
          headers: headers,
          path: "/user/get-user",
          urlParameters: {'phone': phone});
      UserModal? user = UserModal.fromJson(response);
      emit(
        AuthInitial(otpSent: false, loading: false, userObj: user),
      );
      return true;
    } catch (e) {
      AuthInitial(otpSent: false, loading: false, messaage: e.toString());
      return false;
    }
  }
}
