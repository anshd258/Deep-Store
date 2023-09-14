import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/food.request.dart';
import 'package:partner/helpers/models/rental.request.dart';

part 'incoming_request_state.dart';

class IncomingFoodRequestCubit extends Cubit<IncomingRequestState> {
  IncomingFoodRequestCubit() : super(IncomingRequestInitial());

  String path = "/service/get-order-by-type";

  void getIncomingRequest(String code) async {
    emit(IncomingRequestLoading());
    Map<String, dynamic> parameters = {
      "type": RequestType.food.name,
      "status": code
    };
    print(parameters);

    var response = await getData(
            path: path, urlParameters: parameters, queryType: QueryType.get)
        .onError((error, stackTrace) =>
            emit(IncomingRequestError(error.toString())));

    if (response != null) {
      emit(
          IncomingRequestcomplete(foodRequest: FoodRequest.fromJson(response)));
    } else {}
  }

  void rejectRequest(String id) async {
    String path = "/service/update-foodorder/";
    Map<String, dynamic> body = {
      "order": {"id": id, "status": StatusFood.failed.code.toString()}
    };

    await getData(path: path, queryType: QueryType.post, body: body)
        .then((value) =>
            getIncomingRequest(StatusRideRental.pending.code.toString()))
        .onError((error, stackTrace) =>
            emit(IncomingRequestError(error.toString())));
  }

  void acceptRequest(String id) async {
    String path = "/service/update-foodorder/";
    Map<String, dynamic> body = {
      "order": {"id": id, "status": StatusFood.confirmed.code.toString()}
    };

    await getData(path: path, queryType: QueryType.post, body: body)
        .then((value) =>
            getIncomingRequest(StatusRideRental.pending.code.toString()))
        .onError((error, stackTrace) =>
            emit(IncomingRequestError(error.toString())));
  }
}
