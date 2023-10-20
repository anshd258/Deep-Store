import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/food.request.dart';
import 'package:partner/middleware/Repository/AuthRepo.dart';

part 'accepted_requests_state.dart';

class AcceptedRequestsCubit extends Cubit<AcceptedRequestsState> {
  final Authrepository _authrepository;
  AcceptedRequestsCubit(this._authrepository)
      : super(AcceptedRequestsInitial());

  String path = "/service/get-order-by-type";

  void getAcceptedRequests() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    emit(AcceptedRequestsLoading());
    FoodRequest temp;
    Map<String, dynamic> parameters = {
      "type": RequestType.food.name,
      "search_by_user": 0.toString(),
      "status": StatusFood.confirmed.code.toString()
    };
    print(parameters);
    var response = await getData(
            path: path,
            urlParameters: parameters,
            queryType: QueryType.get,
            headers: headers)
        .onError((error, stackTrace) =>
            emit(AcceptedRequestsError(message: error.toString())));
    if (response != null) {
      temp = FoodRequest.fromJson(response);
      emit(AcceptedRequestsLoaded(foodRequest: temp));
    }
  }

  void dropDownValueChange(String roomNumber) {}
}
