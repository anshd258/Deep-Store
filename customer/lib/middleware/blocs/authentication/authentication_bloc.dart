import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/user.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationInitial(null)) {
    on<AuthenticationEvent>((event, emit) {});
    on<UpdateAuthenticationEvent>((event, emit) {



      ///emitting dummy data.
      emit(LoginEvent(User(01, "Hemant", "9340765396")));
    });
  }
}
