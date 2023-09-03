import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/ride.dart';
import '../../../data/repositories/data.repository.dart';
import '../../../data/repositories/user.repository.dart';

part 'ride_event.dart';
part 'ride_state.dart';

class RideBloc extends Bloc<RideEvent, RideState> {
  final UserRepository userRepository;
  final DataRepository dataRepository;
  RideBloc(this.userRepository, this.dataRepository)
      : super(const RideInitial()) {
    on<RideEvent>((event, emit) {});

    on<CreateRideRequest>((event, emit) {
      ///TODO: send a api request to backend
    });
  }
}
