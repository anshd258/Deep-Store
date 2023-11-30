import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:partner/Constants/filterEnum.dart';
import 'package:partner/middleware/Repository/AuthRepo.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  Authrepository _authrepository;
  ServicesCubit(this._authrepository) : super(ServicesInitial());
  Map<Services, ServiceModal> mapping = {
    Services.FOOD: FoodService(),
    Services.HOUSEKEEPING: HouseKeepingService(),
    Services.LAUNDERY: LaundryService(),
    Services.RENTALS: RentalService(),
    Services.TRANSPORT: TransportService()
  };

  void onRefresh(String route, Services tab) {
    var temp =
        mapping.entries.firstWhere((element) => element.key == tab).value;
    print(temp.toString());

    emit( ServicesLoaded(
      food: mapping[Services.FOOD] as FoodService,
      houseKeeping: mapping[Services.HOUSEKEEPING] as HouseKeepingService,
      laundry: mapping[Services.LAUNDERY] as LaundryService,
      rental: mapping[Services.RENTALS] as RentalService,
      transport: mapping[Services.TRANSPORT] as TransportService,
    ));
  }
}
