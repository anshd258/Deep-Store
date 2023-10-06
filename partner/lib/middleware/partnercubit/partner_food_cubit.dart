import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'partner_food_state.dart';

class PartnerFoodCubit extends Cubit<PartnerFoodState> {
  PartnerFoodCubit() : super(PartnerFoodInitial());
}
