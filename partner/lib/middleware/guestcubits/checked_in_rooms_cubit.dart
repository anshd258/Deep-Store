import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/middleware/Repository/AuthRepo.dart';

part 'checked_in_rooms_state.dart';

class CheckedInRoomsCubit extends Cubit<CheckedInRoomsState> {
  Authrepository _authrepository;
  CheckedInRoomsCubit(this._authrepository) : super(CheckedInRoomsLoaded());

  void checkout() async {}
  void updateBooking() async {}
}
