import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'checkin_event.dart';
part 'checkin_state.dart';

class CheckinBloc extends Bloc<CheckinEvent, CheckinState> {
  CheckinBloc() : super(CheckinInitial()) {
    on<CheckinEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
