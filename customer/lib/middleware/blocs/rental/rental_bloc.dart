import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/rental.dart';
import '../../../data/models/rentalrequest.dart';
import '../../../data/repositories/data.repository.dart';
import '../../../data/repositories/datasource.dart';
import '../../../data/repositories/user.repository.dart';
import '../../helpers/constants.dart';

part 'rental_event.dart';
part 'rental_state.dart';

class RentalBloc extends Bloc<RentalEvent, RentalState> {
  final UserRepository userRepository;
  final DataRepository dataRepository;
  RentalBloc(this.userRepository, this.dataRepository)
      : super(RentalInitial()) {
    on<RentalEvent>((event, emit) {});

    on<FetchRentals>((event, emit) async {
      Map<String, dynamic> parameters = {"location": "test"};
      await DataSource.getData(
        path: DataSource.getAllRentals,
        urlParameters: parameters,
      ).then((value) {
        if (value != null) {
          emit(UpdateRentalState(
            rentalList: value.rentalItems,
          ));
        } else {}
      });
    });
    on<FetchRentalRequests>((event, emit) async {
      Map<String, dynamic> parameters = {"user_id": "1"};
      await DataSource.getData(
        path: DataSource.getAllRentalRequests,
        urlParameters: parameters,
      ).then((value) {
        if (value != null) {
          emit(UpdateRentalState(
            rentalRequestList: value.rentalRequests,
          ));
        } else {}
      });
    });

    on<CreateRentalRequest>((event, emit) async {
        Map<String, dynamic> body ={"rental": event.rental.toJson(), "quantity": event.vehicleCount};
        try {
          await DataSource.getData(
            queryType: QueryType.post,
            path: DataSource.createRideRequest,
            body: body,
          );
          print('done requesting ride');
        } catch (e) {
          print('someting when wrong while requesting ride');
        }
    });
  }
}
