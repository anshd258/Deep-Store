import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Constants/filterEnum.dart';

part 'filter_cubit_state.dart';

class FilterCubitCubit extends Cubit<FilterCubitState> {
  FilterCubitCubit()
      : super(FilterCubitState(
            SelectedValue: value.FOOD, loading: false, tabIndex: 1));

  void ChangeFilter(value e, int index) {
    state.SelectedValue = e;
    print(index);
    emit(FilterCubitState(SelectedValue: e, loading: true, tabIndex: index));
    Timer(Duration(seconds: 2), () {
      emit(FilterCubitState(
          SelectedValue: state.SelectedValue, loading: false, tabIndex: index));
    });
  }
}
