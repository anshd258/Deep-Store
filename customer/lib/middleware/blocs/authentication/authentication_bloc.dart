import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/user.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final User user;
  AuthenticationBloc(this.user) : super( AuthenticationInitial(user)) {
    on<AuthenticationEvent>((event, emit) {});
    on<UpdateAuthenticationEvent>((event, emit) {
      /// update auth status here.
    });
  }
}
