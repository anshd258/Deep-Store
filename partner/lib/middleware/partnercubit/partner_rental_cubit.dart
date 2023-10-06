import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'partner_rental_state.dart';

class PartnerRentalCubit extends Cubit<PartnerRentalState> {
  PartnerRentalCubit() : super(PartnerRentalInitial());
}
