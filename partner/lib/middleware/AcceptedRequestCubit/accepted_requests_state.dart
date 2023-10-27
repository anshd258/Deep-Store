part of 'accepted_requests_cubit.dart';

@immutable
abstract class AcceptedRequestsState {
  FoodRequest? foodRequest;
  List<String>? dropDownValues;
  String currentDropDownValue;
  AcceptedRequestsState(
      {this.foodRequest,
      this.dropDownValues,
      this.currentDropDownValue = "All"});
}

class AcceptedRequestsInitial extends AcceptedRequestsState {}

class AcceptedRequestsLoading extends AcceptedRequestsState {}

class AcceptedRequestsLoaded extends AcceptedRequestsState {
  AcceptedRequestsLoaded(
      {super.foodRequest, super.dropDownValues, super.currentDropDownValue});
}

class AcceptedRequestsError extends AcceptedRequestsState {
  String message;
  AcceptedRequestsError({
    required this.message,
  });
}
