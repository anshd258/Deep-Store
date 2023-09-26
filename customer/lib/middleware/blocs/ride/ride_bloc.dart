import 'package:bloc/bloc.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:meta/meta.dart';

import '../../../data/models/ride.dart';
import '../../../data/datasource.dart';
import '../../helpers/shared_preferences_utils.dart';

part 'ride_event.dart';
part 'ride_state.dart';

class RideBloc extends Bloc<RideEvent, RideState> {
  RideBloc() : super(const RideInitial()) {
    on<RideEvent>((event, emit) {});

    on<FetchRideRequests>((event, emit) async {
      await DataSource.getData(
        path: DataSource.getAllRideRequests,
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
        Map<String, dynamic> body = {
              "start_location":event.ride!.pickUpLocation,
    "end_location":event.ride!.dropOffLocation,
    "start_coordinates":event.ride!.pickUpCoordinates,
    "end_coordinates":event.ride!.dropOffCoordinates,
    "price":2000
        };
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
