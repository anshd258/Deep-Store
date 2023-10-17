import '../../Constants/filterEnum.dart';
import 'package:bloc/bloc.dart';



part 'filter_cubit_state.dart';

class FilterCubitCubit extends Cubit<FilterCubitState> {
  FilterCubitCubit()
      : super(FilterCubitState(SelectedValue: value.FOOD, tabIndex: 1));
  int tabIndex = 1;
  void ChangeFilter(value e, int index) {
    tabIndex = index;
    emit(FilterCubitState(SelectedValue: e, tabIndex: index));
  }
}
