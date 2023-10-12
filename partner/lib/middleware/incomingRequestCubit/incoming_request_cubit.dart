import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/food.request.dart';
import 'package:partner/middleware/Repository/AuthRepo.dart';

part 'incoming_request_state.dart';

class IncomingFoodRequestCubit extends Cubit<IncomingRequestState> {
  final Authrepository _authrepository;
  IncomingFoodRequestCubit(this._authrepository)
      : super(IncomingRequestInitial());

  String path = "/service/get-order-by-type";

  void getIncomingRequest(String code, String tokken) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    emit(IncomingRequestLoading());
    Map<String, dynamic> parameters = {
      "type": RequestType.food.name,
      "search_by_user": 0.toString(),
      "status": code
    };
    print(parameters);

    var response = await getData(
            path: path,
            urlParameters: parameters,
            queryType: QueryType.get,
            headers: headers)
        .onError((error, stackTrace) =>
            emit(IncomingRequestError(error.toString())));

    if (response != null) {
      emit(
          IncomingRequestcomplete(foodRequest: FoodRequest.fromJson(response)));
    } else {}
  }

  void rejectRequest(String id, String tokken) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    String path = "/service/update-foodorder/";
    Map<String, dynamic> body = {
      "order": {"id": id, "status": StatusFood.failed.code.toString()}
    };

    await getData(
            path: path, queryType: QueryType.post, body: body, headers: headers)
        .then((value) => getIncomingRequest(
            StatusRideRental.pending.code.toString(), tokken))
        .onError((error, stackTrace) =>
            emit(IncomingRequestError(error.toString())));
  }

  void acceptRequest(String id, String tokken) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    String path = "/service/update-foodorder/";
    Map<String, dynamic> body = {
      "order": {"id": id, "status": StatusFood.confirmed.code.toString()}
    };

    await getData(
            path: path, queryType: QueryType.post, body: body, headers: headers)
        .then((value) => getIncomingRequest(
            StatusRideRental.pending.code.toString(), tokken))
        .onError((error, stackTrace) =>
            emit(IncomingRequestError(error.toString())));
  }
}
