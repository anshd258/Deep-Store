import 'package:bloc/bloc.dart';

import 'package:partner/Constants/filterEnum.dart';

part 'history_filter_state.dart';

class HistoryFilterCubit extends Cubit<HistoryFilterState> {
  HistoryFilterCubit() : super(HistoryFilterState(SelectedValue: value.FOOD));

  int tabIndex = 1;
  void ChangeFilter(value e, int index) {
    tabIndex = index;
    emit(HistoryFilterState(SelectedValue: e,));
  }
}
