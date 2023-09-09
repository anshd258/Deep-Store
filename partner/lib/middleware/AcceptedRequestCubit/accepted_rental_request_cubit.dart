import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/rental.request.dart';

part 'accepted_rental_request_state.dart';

class AcceptedRentalRequestCubit extends Cubit<AcceptedRentalRequestState> {
  AcceptedRentalRequestCubit() : super(AcceptedRentalRequestInitial());
  String path = "/service/get-order-by-type";

  void getAcceptedRequests() async {
    emit(AcceptedRentalRequestLoading());

    Map<String, dynamic> parameters = {
      "type": RequestType.rental.name,
      "status": StatusRideRental.accepted.code.toString()
    };
    print(parameters);
    var response = await getData(
            path: path, urlParameters: parameters, queryType: QueryType.get)
        .onError((error, stackTrace) =>
            emit(AcceptedRentalRequestError(message: error.toString())));
    if (response != null) {
      emit(AcceptedRentalRequestLoaded(rentalRequest: RentalRequestModal.fromJson(response)));
    }
  }
}
