part of 'filter_cubit.dart';

class FilterState {
  FilterValue SelectedValue;
  bool loading = false;
  int tabIndex = 1;
  FilterState(
      {required this.SelectedValue,
      required this.loading,
      required this.tabIndex});
}
