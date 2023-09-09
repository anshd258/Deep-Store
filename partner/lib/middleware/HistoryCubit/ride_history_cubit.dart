import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/ride.request.dart';

part 'ride_history_state.dart';

class RideHistoryCubit extends Cubit<RideHistoryState> {
  RideHistoryCubit() : super(RideHistoryInitial());
  String path = "/service/get-order-by-type";
  void getHistory() async {
    emit(RideHistoryLoading());

    Map<String, dynamic> parameters = {
      "type": RequestType.rental.name,
      "status": StatusRideRental.completed.code.toString()
    };
    print(parameters);
    var response = await getData(
            path: path, urlParameters: parameters, queryType: QueryType.get)
        .onError((error, stackTrace) =>
            emit(RideHistoryError(message: error.toString())));
    if (response != null) {
      emit(
          RideHistoryLoaded(rideRequest:  RidesRequestModal.fromJson(response)));
    }
  }
}
