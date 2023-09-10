import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/rental.request.dart';

part 'incoming_rental_request_state.dart';

class IncomingRentalRequestCubit extends Cubit<IncomingRentalRequestState> {
  IncomingRentalRequestCubit() : super(IncomingRentalRequestInitial());

  String path = "/service/get-order-by-type";

  void getIncomingRequest(String code) async {
    emit(IncomingRentalRequestLoading());
    Map<String, dynamic> parameters = {
      "type": RequestType.rental.name,
      "status": code
    };
    print(parameters);

    var response = await getData(
            path: path, urlParameters: parameters, queryType: QueryType.get)
        .onError((error, stackTrace) =>
            emit(IncomingRentalRequestError(message: error.toString())));

    if (response != null) {
      print(response);
      emit(IncomingRentalRequestCompleted(
          rentalRequest: RentalRequestModal.fromJson(response)));
    } else {}
  }
}
