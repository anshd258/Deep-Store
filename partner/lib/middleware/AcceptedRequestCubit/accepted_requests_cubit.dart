import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/food.request.dart';
import 'package:partner/helpers/models/rental.request.dart';
import 'package:partner/helpers/models/ride.request.dart';

part 'accepted_requests_state.dart';

class AcceptedRequestsCubit extends Cubit<AcceptedRequestsState> {
  AcceptedRequestsCubit() : super(AcceptedRequestsInitial());

  String path = "/service/get-order-by-type";

  void getAcceptedRequests() async {
    emit(AcceptedRequestsLoading());

    Map<String, dynamic> parameters = {
      "type": RequestType.food.name,
      "status": StatusFood.confirmed.code.toString()
    };
    print(parameters);
    var response = await getData(
            path: path, urlParameters: parameters, queryType: QueryType.get)
        .onError((error, stackTrace) =>
            emit(AcceptedRequestsError(message: error.toString())));
    if (response != null) {
      emit(AcceptedRequestsLoaded(foodRequest: FoodRequest.fromJson(response)));
    }
  }
}
