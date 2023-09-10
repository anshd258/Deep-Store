import 'package:bloc/bloc.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:meta/meta.dart';

import '../../../data/models/ride.dart';
import '../../../data/repositories/data.repository.dart';
import '../../../data/repositories/datasource.dart';
import '../../../data/repositories/user.repository.dart';

part 'ride_event.dart';
part 'ride_state.dart';

class RideBloc extends Bloc<RideEvent, RideState> {
  final UserRepository userRepository;
  final DataRepository dataRepository;
  RideBloc(this.userRepository, this.dataRepository)
      : super(const RideInitial()) {
    on<RideEvent>((event, emit) {});
    on<FetchRideRequests>((event, emit) async {
      Map<String, dynamic> parameters = {"user_id": "1"};
      await DataSource.getData(
        path: DataSource.getAllRideRequests,
        urlParameters: parameters,
      ).then((value) {
        if (value != null) {
          emit(UpdateRideRequestsState(
            rideRequests: value.rideRequests,
          ));
        }
      });
    });

    on<CreateRideRequest>((event, emit) async {
      if (event.ride != null) {
        Map<String, dynamic> body = event.ride!.toJson();
        try {
          await DataSource.getData(
            queryType: QueryType.post,
            path: DataSource.createRideRequest,
            body: body,
          );
          print('done requesting ride');
        } catch (e) {
          print('someting when wrong while requesting ride');
        }
      }
    });
  }
}
