import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/ride.request.dart';

part 'accepted_ride_request_state.dart';

class AcceptedRideRequestCubit extends Cubit<AcceptedRideRequestState> {
  AcceptedRideRequestCubit() : super(AcceptedRideRequestInitial());
  String path = "/service/get-order-by-type";

  void getAcceptedRequests() async {
    emit(AcceptedRideRequestLoading());

    Map<String, dynamic> parameters = {
      "type": RequestType.ride.name,
      "status": StatusRideRental.accepted.code.toString()
    };
    print(parameters);
    var response = await getData(
            path: path, urlParameters: parameters, queryType: QueryType.get)
        .onError((error, stackTrace) =>
            emit(AcceptedRideRequestError(message: error.toString())));
    if (response != null) {
      emit(AcceptedRideRequestLoaded(
          rideRequest: RidesRequestModal.fromJson(response)));
    }
  }
}
