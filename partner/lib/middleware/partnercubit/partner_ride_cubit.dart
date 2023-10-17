import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'partner_ride_state.dart';

class PartnerRideCubit extends Cubit<PartnerRideState> {
  PartnerRideCubit() : super(PartnerRideInitial());
}
