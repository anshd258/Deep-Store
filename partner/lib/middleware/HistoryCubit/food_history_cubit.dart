import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/food.request.dart';
import 'package:partner/middleware/Repository/AuthRepo.dart';

part 'food_history_state.dart';

class FoodHistoryCubit extends Cubit<FoodHistoryState> {
  final Authrepository _authrepository;
  FoodHistoryCubit(this._authrepository) : super(FoodHistoryInitial());
  String path = "/service/get-order-by-type";
  void getHistory() async {
    print("data token - ${_authrepository.accessToken}");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${_authrepository.accessToken}',
    };
    emit(FoodHistoryLoading());

    Map<String, dynamic> parameters = {
      "type": RequestType.food.name,
      "search_by_user": 0.toString(),
      "status": StatusFood.completed.code.toString()
    };
    print(parameters);
    var response = await getData(
            path: path,
            urlParameters: parameters,
            queryType: QueryType.get,
            headers: headers)
        .onError((error, stackTrace) =>
            emit(FoodHistoryError(message: error.toString())));
    if (response != null) {
      emit(FoodHistoryLoaded(foodRequest: FoodRequest.fromJson(response)));
    }
  }
}
