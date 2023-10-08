import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import '../../../data/datasource.dart';
import '../../../data/models/ride.dart';
import '../../helpers/constants.dart';

part 'ride_state.dart';

class RideCubit extends Cubit<RideState> {
  RideCubit() : super(const RideInitial());

  Future<bool> fetchRideRequests() async {
    await DataSource.getData(
      path: DataSource.getAllRideRequests,
    ).then((value) {
      if (value != null) {
        emit(UpdateRideRequestsState(
          rideRequests: value.rideRequests,
        ));
        return true;
      }
    });
    return false;
  }

  Future<bool> createRideRequest(Ride ride) async {
    Map<String, dynamic> body = {
      "start_location": "${ride.pickUpLocation}",
      "end_location": "${ride.dropOffLocation}",
      "start_coordinates": "123.23",
      "end_coordinates": "2323.3423",
      "price": 2000
    };
    // Map<String, dynamic> body = {
    //   "start_location": ride.pickUpLocation,
    //   "end_location": ride.dropOffLocation,
    //   "start_coordinates": ride.pickUpCoordinates,
    //   "end_coordinates": ride.dropOffCoordinates,
    //   "price": 2000
    // };
    try {
      Response? response = await DataSource.get(
        queryType: QueryType.post,
        path: DataSource.createRideRequest,
        body: body,
      );
      if (response != null) {
        fetchRideRequests();
        return true;
      }
    } catch (e) {
      print('someting when wrong while requesting ride $e');
    }

    return false;
  }
}
