import 'package:bloc/bloc.dart';
import 'package:customer/data/apiservice.dart';
import 'package:meta/meta.dart';
import '../../../constants/apiendpoints.dart';
import '../../../data/models/ride.dart';

part 'ride_state.dart';

class RideCubit extends Cubit<RideState> {
  RideCubit() : super(const RideInitial());

  void clear() {
    emit(const RideInitial());
  }

  Future<bool> fetchRideRequests() async {
    await ApiService.get(
      endpoint: ApiEndpoints.getAllRideRequests,
    ).then((value) {
      if (value != null) {
        List jsondata = value as List;
        List<Ride> rides = jsondata.map((e) => Ride.fromJson(e)).toList();

        emit(UpdateRideRequestsState(
          rideRequests: rides,
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

    try {
      Map<String, dynamic>? response = await ApiService.post(
        endpoint: ApiEndpoints.createRideRequest,
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
