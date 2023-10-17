import 'package:bloc/bloc.dart';

import 'package:partner/Constants/filterEnum.dart';

part 'partner_filter_state.dart';

class PartnerFilterCubit extends Cubit<PartnerFilterState> {
  PartnerFilterCubit() : super(PartnerFilterState(SelectedValue: value.FOOD));

  int tabIndex = 1;
  void ChangeFilter(value e, int index) {
    tabIndex = index;
    emit(PartnerFilterState(SelectedValue: e,));
  }
}
