import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/food.request.dart';

part 'food_history_state.dart';

class FoodHistoryCubit extends Cubit<FoodHistoryState> {
  FoodHistoryCubit() : super(FoodHistoryInitial());
 String path = "/service/get-order-by-type";
  void getHistory()async{
      emit(FoodHistoryLoading());

    Map<String, dynamic> parameters = {
      "type": RequestType.food.name,
      "status": StatusFood.completed.code.toString()
    };
    print(parameters);
    var response = await getData(
            path: path, urlParameters: parameters, queryType: QueryType.get)
        .onError((error, stackTrace) =>
            emit(FoodHistoryError(message: error.toString())));
    if (response != null) {
      emit(FoodHistoryLoaded(foodRequest: FoodRequest.fromJson(response)));
    }
  }
}
