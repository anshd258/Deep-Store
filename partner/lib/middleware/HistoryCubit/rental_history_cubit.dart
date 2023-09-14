import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/helpers/api.service.dart';
import 'package:partner/helpers/constants.dart';
import 'package:partner/helpers/models/rental.request.dart';

part 'rental_history_state.dart';

class RentalHistoryCubit extends Cubit<RentalHistoryState> {
  RentalHistoryCubit() : super(RentalHistoryInitial());
   String path = "/service/get-order-by-type";
  void getHistory()async{
      emit(RentalHistoryLoading());

    Map<String, dynamic> parameters = {
      "type": RequestType.rental .name,
      "status": StatusRideRental.completed.code.toString()
    };
    print(parameters);
    var response = await getData(
            path: path, urlParameters: parameters, queryType: QueryType.get)
        .onError((error, stackTrace) =>
            emit(RentalHistoryError(message: error.toString())));
    if (response != null) {
      emit(RentalHistoryLoaded(rentalRequest: RentalRequestModal.fromJson(response)));
    }
  }
}
