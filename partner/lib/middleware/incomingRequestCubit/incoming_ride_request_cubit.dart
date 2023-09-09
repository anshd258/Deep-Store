import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/ride.request.dart';

part 'incoming_ride_request_state.dart';

class IncomingRideRequestCubit extends Cubit<IncomingRideRequestState> {
  IncomingRideRequestCubit() : super(IncomingRideRequestInitial());

  String path = "/service/get-order-by-type";

  void getIncomingRequest(String code) async {
    emit(IncomingRideRequestLoading());
    Map<String, dynamic> parameters = {
      "type": RequestType.ride.name,
      "status": code
    };
    print(parameters);

    var response = await getData(
            path: path, urlParameters: parameters, queryType: QueryType.get)
        .onError((error, stackTrace) =>
            emit(IncomingRideRequestError(message: error.toString())));

    if (response != null) {
      emit(IncomingRideRequestLoaded(
          rideRequest: RidesRequestModal.fromJson(response)));
    } else {}
  }
}
