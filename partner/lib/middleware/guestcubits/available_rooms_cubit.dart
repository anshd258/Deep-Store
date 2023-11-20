import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/middleware/Repository/AuthRepo.dart';

part 'available_rooms_state.dart';

class AvailableRoomsCubit extends Cubit<AvailableRoomsState> {
  Authrepository _authrepository;
  AvailableRoomsCubit(this._authrepository) : super(AvailableRoomsLoaded());
  void getRooms() async {}

  void checkInGuests() async {}

  void getQR() async {}
}
