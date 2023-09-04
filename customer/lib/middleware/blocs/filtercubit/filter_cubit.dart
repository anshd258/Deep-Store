import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import '../../helpers/constants.dart';
part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit()
      : super(FilterState(
            SelectedValue: FilterValue.FOOD, loading: false, tabIndex: 1));

  void changeFilter(FilterValue e, int index) {
    state.SelectedValue = e;
    emit(FilterState(SelectedValue: e, loading: true, tabIndex: index));
    Timer(const Duration(seconds: 2), () {
      emit(FilterState(
          SelectedValue: state.SelectedValue, loading: false, tabIndex: index));
    });
  }
}
